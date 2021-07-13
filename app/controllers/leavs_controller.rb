class LeavsController < ApplicationController
  before_action:authenticate_user!
  before_action :set_leav, only: %i[ show edit update destroy approve reject feedback ]

  # GET /leavs or /leavs.json
  def index
    @leavs = Leav.where(status: "Pending").order('created_at ASC')
    authorize @leavs
  end

  # GET /leavs/1 or /leavs/1.json
  def show
    authorize @leav
  end

  # GET /leavs/new
  def new
    @leav = Leav.new
    authorize @leav
  end

  # GET /leavs/1/edit
  def edit
    authorize @leav
  end

  # POST /leavs or /leavs.json
  def create
    @leav = Leav.new(leav_params)
    @leav.user_id = current_user.id
    respond_to do |format|
      if @leav.save
        format.html { redirect_to profile_index_path, notice: "Leav was successfully created." }
        format.json { render :show, status: :created, location: @leav }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leavs/1 or /leavs/1.json
  def update
    respond_to do |format|
      if @leav.update(leav_params)
        if current_user.super_admin? || current_user.admin?
          format.html { redirect_to leavs_path, notice: "Feedback provided Successfully." }
          format.json { render :show, status: :created, location: @leav }
        else
        format.html { redirect_to profile_index_path, notice: "Leave Successfully updated." }
        format.json { render :show, status: :ok, location: @leav }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leavs/1 or /leavs/1.json
  def destroy
    @leav.destroy
    authorize @leav
    respond_to do |format|
      if current_user.employee?
      format.html { redirect_to profile_index_path, notice: "Deleted Successfully!" }
      format.json { head :no_content }
      else
        format.html { redirect_to leavs_url, notice: "Deleted Successfully!" }
        format.json { head :no_content }
      end 
    end
  end

  def approve
    authorize @leav
    @leav.status = 1
    @leav.save
    Notification.create(recipient: @leav.user, actor: current_user, action: "Approved", notifiable: @leav)
    redirect_to leavs_path, notice: "User Notified Successfully!"
  end

  def reject
    authorize @leav
    @leav.status = 2
    @leav.save
    Notification.create(recipient: @leav.user, actor: current_user, action: "Rejected", notifiable: @leav)
    redirect_to leavs_path, notice: "User Notified Successfully!"
  end

  def feedback
    authorize @leav
  end

  def approved_leaves
    @leavs = Leav.where(status: "Approved").order('created_at DESC')
    authorize @leavs
  end

  def rejected_leaves
    @leavs = Leav.where(status: "Rejected").order('created_at DESC')
    authorize @leavs
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav
      @leav = Leav.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leav_params
      params.require(:leav).permit(:leave_type, :start_date, :end_date, :duration, :reason, :feedback)
    end
end

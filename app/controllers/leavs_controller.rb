class LeavsController < ApplicationController
  before_action :set_leav, only: %i[ show edit update destroy ]

  # GET /leavs or /leavs.json
  def index
    @leavs = Leav.all
  end

  # GET /leavs/1 or /leavs/1.json
  def show
  end

  # GET /leavs/new
  def new
    @leav = Leav.new
  end

  # GET /leavs/1/edit
  def edit
  end

  # POST /leavs or /leavs.json
  def create
    @leav = Leav.new(leav_params)

    respond_to do |format|
      if @leav.save
        format.html { redirect_to @leav, notice: "Leav was successfully created." }
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
        format.html { redirect_to @leav, notice: "Leav was successfully updated." }
        format.json { render :show, status: :ok, location: @leav }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leavs/1 or /leavs/1.json
  def destroy
    @leav.destroy
    respond_to do |format|
      format.html { redirect_to leavs_url, notice: "Leav was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav
      @leav = Leav.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leav_params
      params.require(:leav).permit(:leave_type, :start_date, :end_date, :duration, :reason, :status, :feedback)
    end
end

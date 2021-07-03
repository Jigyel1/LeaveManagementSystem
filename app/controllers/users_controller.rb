class UsersController < ApplicationController
    before_action:authenticate_user!
    after_action :verify_authorized
  
    def index
      @users = User.all
      authorize User
    end

    def new
      @user = User.new
      authorize @user
    end

    def create
      @user = User.new(user_params)
      @user.save 
      authorize @user
      redirect_to users_path, :notice => "User Added."

    end
    
    def show
      @user = User.find(params[:id])
      authorize @user
    end
  
    def update
      @user = User.find(params[:id])
      authorize @user
      if @user.update(secure_params)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end
  
    def destroy
      user = User.find(params[:id])
      authorize user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    end
  
    private
  
    def secure_params
      params.require(:user).permit(:role)
    end

    def user_params
      params.permit(:fname, :lname, :dob, :phone, :designation, :address, :email, :password, :password_confirmation)
    end
end

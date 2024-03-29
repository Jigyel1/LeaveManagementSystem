class ApplicationController < ActionController::Base
    include Pundit
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    protect_from_forgery with: :exception
  
    private
  
    def user_not_authorized
      flash[:alert] = "Access denied."
      redirect_to (request.referrer || root_path)
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :dob, :designation, :phone, :address])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :dob, :designation, :phone, :address, :image])
    end
end

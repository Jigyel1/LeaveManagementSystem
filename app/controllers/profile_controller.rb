class ProfileController < ApplicationController
  before_action :authenticate_user!
    def index
      if current_user.employee? || current_user.admin?
      @user = current_user
      @leavs = Leav.order('created_at DESC')
      else
        redirect_to root_path
      end
    end
end

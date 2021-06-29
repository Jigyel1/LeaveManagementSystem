class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.super_admin? || @current_user.admin? 
  end

  def show?
    @current_user.super_admin? || @current_user.admin?
  end

  def update?
    @current_user.super_admin?
  end

  def destroy?
    @current_user.super_admin?
  end

end
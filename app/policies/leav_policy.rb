class LeavPolicy
    attr_reader :current_user, :model
  
    def initialize(current_user, model)
      @current_user = current_user
      @leavs = model
    end
  
    def index?
      @current_user.super_admin? ||  @current_user.admin?
    end

    def new?
        @current_user.employee?
    end

    def create?
        @current_user.employee?
    end

    def show?
        @current_user.super_admin? ||  @current_user.admin? || @current_user.employee?
    end
    
    def edit?
         @current_user.employee?
    end

    def update?
        @current_user.super_admin? ||  @current_user.admin? || @current_user.employee?
    end

    def destroy?
        @current_user.super_admin? || @current_user.employee?
    end

    def approve?
        @current_user.super_admin? ||  @current_user.admin?
    end

    def reject?
        @current_user.super_admin? ||  @current_user.admin?
    end

    def feedback?
        @current_user.super_admin? ||  @current_user.admin?
    end

    def approved_leaves?
        @current_user.super_admin? ||  @current_user.admin?
    end

    def rejected_leaves?
        @current_user.super_admin? ||  @current_user.admin?
    end
    
    
end
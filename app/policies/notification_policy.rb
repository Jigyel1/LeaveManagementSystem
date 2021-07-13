class NotificationPolicy
    attr_reader :current_user, :model
  
    def initialize(current_user, model)
      @current_user = current_user
      @notifications = model
    end
  
    def index?
      @current_user.employee?
    end

    def mark_as_read?
        @current_user.employee?
    end
    
end
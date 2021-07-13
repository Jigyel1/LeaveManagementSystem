class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @notifications = Notification.where(recipient: current_user).unread.order('created_at DESC')
    authorize @notifications
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    redirect_to notifications_path
    authorize @notifications
  end
end

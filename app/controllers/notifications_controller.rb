class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order('created_at DESC')
  end
  def link_through
    @notification = Notification.find(params[:id])
    # @micropost = Micropost.find(params[:micropost_id])
    @notification.update read: true
    redirect_to current_micropost_path(@notification.micropost.id)
  end
end

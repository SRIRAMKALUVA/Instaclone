class CommentsController < ApplicationController
  before_action :signed_in_user
  def create
    @comment = @commentable.comments.new comment_params
    @micropost = Micropost.find(params[:micropost_id])
    @comment.user_id = current_user.id
    if @comment.save
      create_notification @micropost, @comment
      redirect_back fallback_location: root_path
    end
  end
  

  private
  def comment_params
    params.require(:comment).permit(:body, :micropost_id)

  end

  def create_notification(micropost, comment)
	   return if micropost.user.id == current_user.id
      Notification.create(user_id: micropost.user.id,
                          notified_by_id: current_user.id,
                          micropost_id: micropost.id,
			                       identifier: comment.id,
                             notice_type: 'comment')

  end
end

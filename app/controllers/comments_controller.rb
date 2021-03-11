class CommentsController < ApplicationController
  before_action :signed_in_user
  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.save
    redirect_to root_url
  end

  private
  def comment_params
    params.require(:comment).permit(:body)

  end
end

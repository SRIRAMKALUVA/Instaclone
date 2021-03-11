class CommentsController < ApplicationController
  before_action :find_post
  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to root_url
    else
      render 'new'
  end

  private
  def find_post
    @post = Micropost.find(params[:micropost_id])

  end
end

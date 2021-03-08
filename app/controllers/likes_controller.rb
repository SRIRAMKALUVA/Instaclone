class LikesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_post
  def create
    @micropost.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @micropost }
      format.js
    end
  end

  def destroy
    @micropost.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @micropost }
      format.js
    end
  end

  private

    def set_post
      # @micropost = Micropost.find(params[:micropost_id])
      @micropost = current_user.microposts.find_by(id: params[:id])
    end
end

class MicropostsController < ApplicationController
  include ActionController::MimeResponds
  before_action :signed_in_user, only: [:create, :vote, :destroy]
  before_action :correct_user,   only: [:destroy]
  protect_from_forgery except: :vote
  # respond_to :js {render layout: false}
  respond_to do |format|
  #   format.html
    format.js {render layout: false}
  end


  def index
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  def vote
    @micropost_all = Micropost.find(params[:id])
    if !current_user.liked? @micropost_all
      if @micropost_all.liked_by current_user
        create_notification @micropost_all
      end
      # respond_to :js
      redirect_back fallback_location: root_path
    elsif current_user.liked? @micropost_all
      @micropost_all.unliked_by current_user
      # respond_to :js
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_back fallback_location: root_path
  end
  private

  def create_notification(micropost_all)
      return if micropost_all.user.id == current_user.id
      Notification.create(
          user_id: micropost_all.user.id,
          notified_by_id: current_user.id,
          micropost_id: micropost_all.id,
          identifier: micropost_all.id,
          notice_type: 'lik')
  end

    def micropost_params
      params.require(:micropost).permit(:caption, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end

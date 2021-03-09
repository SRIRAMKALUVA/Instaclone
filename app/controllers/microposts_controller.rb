class MicropostsController < ApplicationController
  include ActionController::MimeResponds
  before_action :signed_in_user, only: [:create, :vote, :destroy]
  before_action :correct_user,   only: [:destroy]
  respond_to :js, :json, :html
  respond_to do |format|
    format.html
    format.js {render layout: false}
  end


  def index
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
      @micropost_all.liked_by current_user
      redirect_to root_url
    elsif current_user.liked? @micropost_all
      @micropost_all.unliked_by current_user
      redirect_to root_url
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end
  private

    def micropost_params
      params.require(:micropost).permit(:caption, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end

class FavoriteMicropostsController < ApplicationController
  before_action :set_micropost, only: [:create, :destroy]

  def index
    @favorites = current_user.favorite_microposts
  end

  def create
    if Favorite.create(favorited: @micropost, user: current_user)
      redirect_back fallback_location: root_path, notice: 'micropost has been favorited'
    else
      redirect_back fallback_location: root_path, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @micropost.id, user_id: current_user.id).first.destroy
    redirect_back fallback_location: root_path, notice: 'micropost is no longer in favorites'
  end

  private

  def set_micropost
    @micropost = Micropost.find(params[:micropost_id] || params[:id])
  end
end

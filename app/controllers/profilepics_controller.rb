class ProfilepicsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @profilepic = current_user.profilepics.build(profilepic_params)
    if @profilepic.save
      flash[:success] = "profilepic created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  private

    def profilepic_params
      params.require(:profilepic).permit(:image)
    end
end

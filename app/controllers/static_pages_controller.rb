class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @users = User.paginate(page: params[:page])
    end
  end
  def profilepic
    if signed_in?
      @profilepic  = current_user.profilepics.build
    end
  end
  def help
  end
  def about
  end
  def contact
  end
end

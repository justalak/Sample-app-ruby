class HomePageController < ApplicationController
  def index
    if is_logged_in?
      @micropost = current_user.microposts.build
      @user = current_user
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 20)
    else
      redirect_to login_path
    end
  end
end

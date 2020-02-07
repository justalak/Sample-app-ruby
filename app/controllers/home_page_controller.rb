class HomePageController < ApplicationController
  def index
    if is_logged_in?
      redirect_to current_user
    else
      redirect_to login_path
    end
  end
end

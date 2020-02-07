class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def log_in_user?
    if !is_logged_in?
      store_location
      redirect_to login_path
    end
  end
end

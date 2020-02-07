class SessionsController < ApplicationController
  def new
    if is_logged_in?
      redirect_to @current_user
    else
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      params[:session][:remember] == "1" ? remember(user) : forget(user)
      if user.activated?
        flash[:success] = "Welcome to Blog, #{user.name}"
      else
        flash[:danger] = "Your account is not activated. Please check you email to activate your account."
      end
      log_in user
      forward_after_login user
    else
      flash[:danger] = "Invalid Email or Password"
      redirect_to "/login"
    end
  end

  def destroy
    if is_logged_in?
      log_out
    end
    redirect_to root_url
  end
end

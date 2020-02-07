class AccountActivationsController < ApplicationController
  def edit
    token = params[:id]
    user = User.find_by(email: params[:email])
    if user && user.authenticate?(:activation, token)
      flash[:success] = "Account activated"
      user.activate
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end

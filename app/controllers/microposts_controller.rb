class MicropostsController < ApplicationController
  before_action :log_in_user?, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created"
      redirect_to current_user
    else
      flash[:danger] = "Some thing's wrong."
      redirect_to curent_user
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end

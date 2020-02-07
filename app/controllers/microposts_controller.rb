class MicropostsController < ApplicationController
  before_action :log_in_user?, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created"
      redirect_to root_path
    else
      flash[:danger] = "Some thing's wrong, " + @micropost.errors.full_messages[0]
      redirect_to root_path
    end
  end

  def destroy
    micropost = Micropost.find_by(id: params[:id])

    if micropost
      micropost.destroy
      redirect_to request.referrer || current_user
      flash[:success] = "Delete micropost successfully"
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    if @micropost.nil?
      redirect_to root_path
    end
  end
end

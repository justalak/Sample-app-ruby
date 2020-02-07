class UsersController < ApplicationController
  before_action :log_in_user?, only: [:index, :edit, :update]
  before_action :correct_user?, only: [:update, :edit]

  def index
    @users = User.all.order(created_at: :asc).paginate(page: params[:page], per_page: User.per_page)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @micropost=@user.microposts.build
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "Please check your email to activate your account."
      log_in @user
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update_attributes(user_params)
      flash[:success] = "Updated profile successfully"

      redirect_to user
    else
      render "edit"
    end
  end

  def destroy
    user = User.find_by(params[:id])

    if user
      user.destroy
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def correct_user?
    if params[:id]
      @user = User.find(params[:id])
      if !current_user?(@user)
        redirect_to root_url
      end
    end
  end
end

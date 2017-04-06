class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = user_params[:email]
    @user.password = user_params[:password]
    @user.password_confirmation = user_params[:password_confirmation]

    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

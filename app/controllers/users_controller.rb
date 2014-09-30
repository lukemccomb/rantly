class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      redirect_to "/"
    else
      render "users/new"
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password_digest, :first_name, :last_name, :bio)
  end

end

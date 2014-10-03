class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save!
      redirect_to "/"
      flash[:notice] = "Thank you for registering! Please log in to being ranting."
    else
      render "users/new"
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rate)
  end

end

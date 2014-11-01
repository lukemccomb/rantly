class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user.admin && user.authenticate(params[:user][:password])
      sign_in(user)
      redirect_to admin_dashboard_path
    elsif user && user.authenticate(params[:user][:password])
      sign_in(user)
      redirect_to dashboard_path
    else
      @user = User.new
      @user.errors[:base] << "Username / password is invalid"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to :main
  end

end

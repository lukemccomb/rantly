class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      if user.admin
        sign_in(user)
        redirect_to admin_dashboard_path
      elsif disabled_user?(user)
        flash[:notice] = "Your account has been disabled."
        redirect_to main_path
      else
        sign_in(user)
        redirect_to dashboard_path
      end
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

  private

  def disabled_user?(user)
    Disable.find_by(user_id: user.id)
  end

end

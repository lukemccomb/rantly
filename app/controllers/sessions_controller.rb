class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(allowed_params)
    sign_in(user)
    redirect_to "/dashboard"
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_path
  end

  private

  def allowed_params
    params.require(:session).permit(:email, :password)
  end

end

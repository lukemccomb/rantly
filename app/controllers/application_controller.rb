class ApplicationController < ActionController::Base

  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def sign_in user
    session[:user_id] = user.id
  end

end

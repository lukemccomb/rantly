class ApplicationController < ActionController::Base

  def current_user
    if cookies[:user_id]
      user_id = cookies.signed[:user_id]
      User.find(user_id)
    end
  end
  helper_method :current_user

  def sign_in user
    cookies.signed[:user_id] = user.id
  end

end

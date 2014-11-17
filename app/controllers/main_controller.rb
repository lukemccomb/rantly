class MainController < ApplicationController
  before_filter :check_logged_in_user

  def index
    if flash.empty? && session.delete(:visited)
      flash[:notice] = "Welcome back! If you like to rant, you should join."
    end

    session[:visited] = true
  end

  private

  def check_logged_in_user
    if current_user
      redirect_to dashboard_path
    end
  end
end
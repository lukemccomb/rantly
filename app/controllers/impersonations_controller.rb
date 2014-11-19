class ImpersonationsController < ApplicationController

  def create
    session[:admin_user] = current_user.id
    session[:user_id] = params[:user_id]
    session[:impersonate] = true
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = session[:admin_user]
    session[:impersonate] = false
    redirect_to admin_dashboard_path
  end

end
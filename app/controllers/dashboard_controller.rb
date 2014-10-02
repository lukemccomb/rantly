class DashboardController < ApplicationController

  def dashboard

    @user = current_user

  end

end
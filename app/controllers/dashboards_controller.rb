class DashboardsController < ApplicationController

  def show
    @rant = Rant.new
    @user_rants = Rant.where(user_id: current_user.id)
    @rants = Rant.where.not(user_id: current_user.id)
  end

end
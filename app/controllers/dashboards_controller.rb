class DashboardsController < ApplicationController

  def show
    @rant = Rant.new
    @user_rants = Rant.not_spam.where(user_id: current_user.id)
    @rants = Rant.not_spam.where.not(user_id: current_user.id)
  end

end
class DashboardsController < ApplicationController

  def show
    user = current_user.username
    @rant = Rant.new
    @user_rants = Rant.not_spam.where(user_id: current_user.id)
    @rants = Rant.not_spam.where.not(user_id: current_user.id)
    @mentions = Rant.where("rant iLIKE ? OR title iLIKE ?", "%@#{user}%", "%@#{user}%")
  end

end
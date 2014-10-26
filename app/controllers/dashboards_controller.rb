class DashboardsController < ApplicationController

  def show
    @rant = Rant.new
    @fullname = full_name(current_user)
    @user_rants = Rant.where(user_id: current_user.id)
    @rants = Rant.where.not(user_id: current_user.id)
  end

  private

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

end
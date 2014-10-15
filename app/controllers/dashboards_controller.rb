class DashboardsController < ApplicationController

  def show
    @rant = Rant.new
    @user = current_user
    @fullname = full_name(current_user)
    @user_rants = Rant.where(user_id: @user.id)
    @all_rants = Rant.where.not(user_id: @user.id)
  end

  private

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

end
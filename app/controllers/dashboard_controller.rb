class DashboardController < ApplicationController

  def dashboard
    @user = current_user
    @fullname = full_name(current_user)
    @rant = Rant.new
  end

  private

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

end
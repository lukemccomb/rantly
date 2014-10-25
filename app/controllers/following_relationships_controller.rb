class FollowingRelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.followed_users << user
    redirect_to user
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.followed_users.
    redirect_to user
  end

  def show

    @rant = Rant.new
  end
end
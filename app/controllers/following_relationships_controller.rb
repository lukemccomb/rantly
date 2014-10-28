class FollowingRelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.followed_users << user
    redirect_to :back
  end

  def destroy
    current_user.followed_users.delete(params[:user_id])
    redirect_to :back
  end

  def show
    @current_user = current_user
    @rant = Rant.new
  end
end
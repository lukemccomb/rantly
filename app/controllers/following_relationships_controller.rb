class FollowingRelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.followed_users << user
    render :inline => "<%= button_to 'Unfollow', user_unfollow_path(#{user.id}),
              :class => 'unfollow',
              :form_class => 'unfollow#{user.id}',
              remote: true,
              data: {user_id: #{user.id}} %>"
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.followed_users.delete(params[:user_id])
    render :inline => "<%= button_to 'Follow',
              user_follow_path(#{user.id}),
              :class => 'follow',
              :form_class => 'follow#{user.id}',
              remote: true,
              data: {user_id: #{user.id}} %>"
  end

  def show
    @current_user = current_user
    @rant = Rant.new
  end
end
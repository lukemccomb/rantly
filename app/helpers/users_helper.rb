module UsersHelper
  def follow_button user
    button_to 'Follow', user_follow_path(user)
  end

  def unfollow_button user
    button_to 'Unfollow', user_unfollow_path(user)
  end

  def following_user user
    current_user.followed_users.where(id: user.id) == nil
  end
end

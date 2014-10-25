module UsersHelper
  def follow_button user
    button_to 'Follow', user_follow_path(user)
  end

  def unfollow_button user
    button_to 'Follow', user_follow_path(user)
  end

  def following_user user
    nil
  end
end

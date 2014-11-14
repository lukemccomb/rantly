module UsersHelper
  # def follow_button user
  #   button_to 'Follow',
  #             user_follow_path(user),
  #             {:class => 'follow'},
  #             remote: true,
  #             data: {user_id: user.id}
  # end
  #
  # def unfollow_button user
  #   button_to 'Unfollow',
  #             user_unfollow_path(user),
  #             {:class => 'unfollow'},
  #             remote: true,
  #             data: {user_id: user.id}
  # end

  def dash_follow_button user
    button_to 'Follow', user_follow_path(user),
              :class => 'follow',
              :form_class => "follow#{user.id}",
              remote: true,
              data: {user_id: user.id}

  end

  def dash_unfollow_button user
    button_to 'Unfollow', user_unfollow_path(user),
              :class => 'unfollow',
              :form_class => "unfollow#{user.id}",
              remote: true,
              data: {user_id: user.id}
  end

  def follow_page_unfollow_button user
    button_to 'Unfollow', user_unfollow_path(user.id),
              :class => 'unfollow-following-page',
              :form_class => "follow-page-unfollow#{user.id}",
              remote: true,
              data: {user_id: user.id}
  end

  def following_user user_id
    current_user.followed_users.find_by(id: user_id)
  end

end


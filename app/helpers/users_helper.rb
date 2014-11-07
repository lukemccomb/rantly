module UsersHelper
  def follow_button user
    button_to 'Follow',
              user_follow_path(user),
              {:class => 'follow'}
  end

  def unfollow_button user
    button_to 'Unfollow',
              user_unfollow_path(user),
              {:class => 'unfollow'}
  end

  def dash_follow_button user
    button_to 'Follow', user_follow_path(user),
              {:class => 'follow', user_id: user.id}

  end

  def dash_unfollow_button user
    button_to 'Unfollow', user_unfollow_path(user),
              {:class => 'unfollow', user_id: user.id}
  end

  def following_user user_id
    current_user.followed_users.find_by(id: user_id)
  end

  def favorite_button rant
    button_to 'Favorite', rant_favorites_path(rant.id)
  end

  def unfavorite_button rant
    button_to 'Unfavorite', rant_favorite_path(rant_id: rant.id)
  end

  def dash_favorite_button rant
    if favorite_rant(rant)
      button_to 'Unfavorite',
                rant_favorite_path(id: current_user.id, rant_id: rant.id),
                :class => 'unfavorite',
                # :id => 'unfavorite-show',
                method: :delete,
                # remote: true,
                data: { rant_id: rant.id, user_id: current_user.id }
      # button_to 'Favorite',
      #           rant_favorites_path(id: current_user.id, rant_id: rant.id),
      #           :class => 'favorite',
      #           # id: 'favorite-hide',
      #           remote: true,
      #           data: { rant_id: rant.id, user_id: current_user.id }
    else
      button_to 'Favorite',
                rant_favorites_path(id: current_user.id, rant_id: rant.id),
                :class => 'favorite',
                # id: 'favorite-show',
                # remote: true,
                data: { rant_id: rant.id, user_id: current_user.id }
      # button_to 'Unfavorite',
      #           rant_favorite_path(id: current_user.id, rant_id: rant.id),
      #           :class => 'unfavorite',
      #           # :id => 'unfavorite-hide',
      #           method: :delete,
      #           remote: true,
      #           data: { rant_id: rant.id, user_id: current_user.id }
    end
  end

  def favorite_rant rant
    current_user.favorites.find_by(rant_id: rant.id)
  end

end


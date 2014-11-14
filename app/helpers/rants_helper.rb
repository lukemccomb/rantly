module RantsHelper

  def hash_tagger text
    link_hashtags(text).html_safe
  end

  def rant_favorites(rant)
    fav_or_favs(rant)
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                        autolink: true, tables: true, escape_html: true)
    markdown.render(text).html_safe
  end

  def three_hundo(text)
    if text.length > 300
      text[0..299] + "..."
    else
      text
    end
  end

  # change to truncate method

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
                method: :delete,
                remote: true,
                data: { rant_id: rant.id, id: favorite_rant(rant).id }
    else
      button_to 'Favorite',
                rant_favorites_path(id: current_user.id, rant_id: rant.id),
                :class => 'favorite',
                remote: true,
                data: { rant_id: rant.id, user_id: current_user.id }
    end
  end

  def favorite_rant rant
    current_user.favorites.find_by(rant_id: rant.id)
  end

  def fav_or_favs(rant)
    if rant.favorites.length == 1
      render html:
        "<h5><span class='fav-count'>#{rant.favorites.length}</span> Favorite #{dash_favorite_button(rant)}</h5>".html_safe
    else
      render html:
         "<h5><span class='fav-count'>#{rant.favorites.length}</span> Favorites #{dash_favorite_button(rant)}</h5>".html_safe
    end
  end

    private

    def link_hashtags(text)
      text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1), class: 'hashtag-link') }
    end


end

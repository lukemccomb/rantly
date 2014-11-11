module RantsHelper

  def hash_tagger text
    link_hashtags(text).html_safe
  end

  def rant_favorites(rant)
    if favorite_rant(rant)
      fav_or_favs(rant)
    else
      fav_or_favs(rant)
    end
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

    private

    def link_hashtags text
      text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1), class: 'hashtag-link') }
    end

    def fav_or_favs rant
      if rant.favorites.length == 1
        render html:
          "<h5>#{rant.favorites.length} Favorite #{dash_favorite_button(rant)}</h5>".html_safe
      else
        render html:
           "<h5>#{rant.favorites.length} Favorites #{dash_favorite_button(rant)}</h5>".html_safe
      end
    end

end

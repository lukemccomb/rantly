module RantsHelper
  def hash_tagger text
    link_hashtags(strip_tags(text)).html_safe
  end

  private

  def link_hashtags text
    text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1)) }
  end

end

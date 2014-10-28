class HashtagsController < ApplicationController

  def show
    @search = Search.new(term: hashtag)
    @rant = Rant.new
  end

  private

  def hashtag
    "##{params[:id]}"
  end

end
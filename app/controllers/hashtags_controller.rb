class HashtagsController < ApplicationController

  def show
    @search = Search.new(term: hashtag)
    @new_rant = Rant.new
  end

  private

  def hashtag
    "##{params[:id]}"
  end

end
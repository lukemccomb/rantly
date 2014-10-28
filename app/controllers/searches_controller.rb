class SearchesController < ApplicationController

  def new
    @rant = Rant.new
  end

  def show
    @rant = Rant.new
    @search = Search.new(params[:search])
  end

end
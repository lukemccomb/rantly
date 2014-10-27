class SearchesController < ApplicationController

  def new
    @new_rant = Rant.new
  end

  def show
    @new_rant = Rant.new
    @search = Search.new(params[:search])
  end

end
class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.rant_id = params[:rant_id]
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to :back
  end

  def show
    @rant = Rant.new
    @favorites = []
    current_user.favorites.each { |fav| @favorites << fav.rant }
  end

  def destroy
    @favorite = Favorite.where(rant_id: params[:rant_id], user_id: current_user.id)
    @favorite.first.destroy!
    redirect_to :back
  end
end
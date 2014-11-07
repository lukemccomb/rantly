class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.rant_id = params[:rant_id]
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to :back
    # fav_number = Rant.find_by(id: params[:rant_id]).favorites.length
    # render :json => {fav_count:  fav_number.to_s }
  end

  def show
    @rant = Rant.new
    @favorites = []
    current_user.favorites.each do |fav|
      unless fav.rant.spam
        @favorites << fav.rant
      end
    end
  end

  def destroy
    @favorite = Favorite.where(rant_id: params[:rant_id], user_id: current_user.id)
    @favorite.first.destroy!
    redirect_to :back
  end
end
class FavoritesController < ApplicationController
  include ActionView::Helpers::UrlHelper
  include RantsHelper

  def create
    @favorite = Favorite.new
    @favorite.rant_id = params[:rant_id]
    @favorite.user_id = current_user.id
    @favorite.save
    rant = Rant.find_by(id: params[:rant_id])
    render :inline => "<%= button_to 'Unfavorite',
                rant_favorite_path(id: #{current_user.id}, rant_id: #{rant.id}),
                :class => 'unfavorite',
                remote: true,
                method: :delete,
                data: { rant_id: #{rant.id}, id: #{favorite_rant(rant).id} } %>"
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
    @favorite = Favorite.find_by(rant_id: params[:rant_id], user_id: current_user.id)
    @favorite.destroy!
    rant = Rant.find_by(id: params[:rant_id])
    render :inline => "<%= button_to 'Favorite',
                rant_favorites_path(id: #{current_user.id}, rant_id: #{rant.id}),
                :class => 'favorite',
                remote: true,
                data: { rant_id: #{rant.id}, user_id: #{current_user.id} } %>"
  end
end
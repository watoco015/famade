class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.build(art_id: params[:art_id])
    favorite.save
    redirect_to arts_path
  end

  def destroy
    favorite = Favorite.find_by(art_id: params[:art_id], user_id: current_user.id)
    favorite.destroy
    redirect_to arts_path
  end
end
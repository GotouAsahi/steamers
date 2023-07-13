class FavoritesController < ApplicationController
  def create
    return unless Favorite.find_by(game_id: params[:game_id], user_id: current_user.id).blank?

    @game = Game.find(params[:game_id])
    @favorite = current_user.favorites.new(game_id: @game.id)
    @favorite.save
    render 'replace_btn.js.erb'
  end

  def destroy
    return if Favorite.find_by(game_id: params[:game_id], user_id: current_user.id).blank?

    @game = Game.find(params[:game_id])
    @favorite = current_user.favorites.find_by(game_id: @game.id)
    @favorite.destroy
    render 'replace_btn.js.erb'
  end
end

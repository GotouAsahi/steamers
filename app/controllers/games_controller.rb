class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: %i[edit update destroy]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to game_path(@game.id)
      flash[:notice] = 'You have created game successfully.'
    else
      @games = Game.all
      render :new
    end
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
  end

  def edit
    @game = Game.find(params[:id])
    if @game.user == current_user
      @game = Game.find(params[:id])
      render action: :edit
    else
      redirect_to :edit
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game.id)
      flash[:notice] = 'You have updated game successfully.'
    else
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :image, :caption)
  end

  def ensure_correct_user
    @game = Game.find(params[:id])
    return if @game.user == current_user

    redirect_to games_path
  end
end

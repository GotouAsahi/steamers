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
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    if params[:sort] == 'newer'
      @games = Game.order(created_at: 'DESC')
    elsif params[:sort] == 'higher'
      @games = Game.order(star: 'DESC')
    elsif params[:sort] == 'liker'
      @games = Game.includes(:favorites).sort_by { |x| x.favorites.where(created_at: from...to).size }.reverse
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, game_id: @game.id)
      current_user.view_counts.create(game_id: @game.id)
    end
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

  def search
    @tag = params[:tag]
    if @tag.present?
      @games = Game.where("tag LIKE?","%#{@tag}%")
    else
      @games = Game.all
    end
    render :search_result
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :image, :tag, :caption,:star)
  end

  def ensure_correct_user
    @game = Game.find(params[:id])
    return if @game.user == current_user

    redirect_to games_path
  end
end

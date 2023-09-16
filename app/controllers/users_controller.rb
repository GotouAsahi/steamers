class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @games = @user.games
    @today_games = @games.created_today
    @yesterday_games = @games.created_yesterday
    @this_week_games = @games.created_this_week
    @last_week_games = @games.created_last_week
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = 'You have updated user successfully.'
    else
      render 'edit'
    end
  end

  def search
    @user = User.find(params[:user_id])
    @games = @user.games
    @game = Game.new
    if params[:created_at] == ''
      @search_game = '日付を選択してください'
    else
      create_at = params[:created_at]
      @search_game = @games.where(['created_at LIKE ? ', "#{create_at}%"]).count
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    return if @user == current_user

    redirect_to user_path(current_user)
  end
end

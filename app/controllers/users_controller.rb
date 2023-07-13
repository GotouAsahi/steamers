class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @games = @user.games
  end

  def edit
  end

  def update
  end
end

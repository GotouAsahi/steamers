class GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = current_user.game_comments.new(game_comment_params)
    @comment.game_id = @game.id
    @comment.save
    render 'create.js.erb'
  end

  def destroy
    @game = Game.find(params[:game_id])
    @comment = GameComment.find_by(id: params[:id], game_id: params[:game_id])
    @comment.destroy
    render 'destroy.js.erb'
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end
end

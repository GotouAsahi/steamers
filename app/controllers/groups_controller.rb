class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_owner, only: %i[edit update,destroy]
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      @group.users << current_user
      redirect_to groups_path
    else
      render :new
    end
  end

  def index
    @game = Game.new
    @groups = Group.all
  end

  def show
    @game = Game.new
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  group_path(@group)
  end

  def exit
    @group = Group.find(params[:group_id])
    @group.users.delete(current_user)
    redirect_to groups_path
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end


  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end


  def ensure_correct_owner
    @group = Group.find(params[:id])
    redirect_to groups_path unless @group.owner == current_user
  end
end

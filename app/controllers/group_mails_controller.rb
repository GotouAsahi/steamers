class GroupMailsController < ApplicationController
  before_action :ensure_correct_owner
  def new
      @new_group_mail = GroupMail.new
      @group = Group.find(params[:group_id])
  end
  def create
      @new_group_mail = GroupMail.new(str_params)
      @group = Group.find(params[:group_id])
      @new_group_mail.group_id = @group.id
      @new_group_mail.save
      @owner = @group.owner
      @group.users.each do |user|
      GroupMailer.with(
      title: @new_group_mail.title, content: @new_group_mail.content,
      owner_email: @owner.email, owner_name: @owner.name, user_name: user.name,
      user_email: user.email, group_name: @group.name
    ).send_mail.deliver_later
      end
      render :complete_mailed
  end

  private
  def str_params
      params.require(:group_mail).permit(:title, :content)
  end

  def ensure_correct_owner
    @group = Group.find(params[:group_id])
    redirect_to groups_path unless @group.owner == current_user
  end
end

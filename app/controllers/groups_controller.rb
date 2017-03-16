class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to controller: :chats, action: :index, notice: 'チャットグループが作成されました。'
    else
      flash.now[:alert] = 'グループが作成されませんでした。'
      render new_group_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end

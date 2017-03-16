class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash.now[:notice] = 'チャットグループが作成されました。'
      render template: "chats/index"
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

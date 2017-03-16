class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to controller: :chats, action: :index
      flash[:notice] = 'チャットグループが作成されました'
    else
      redirect_to action: :new
      flash[:alert] = "グループ名を入力してください"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end

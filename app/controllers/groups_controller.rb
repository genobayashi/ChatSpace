class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    
  end

  def create
    Group.create(group_params)
    redirect_to controller: :chats, action: :index
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end

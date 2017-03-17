class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit

  end

  def update
    
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループが作成されました。'
    else
      flash.now[:alert] = 'グループが作成されませんでした。'
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end

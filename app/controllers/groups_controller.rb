class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループが更新されました。'
    else
      flash.now[:alert] = 'グループの更新に失敗しました'
      render :edit
    end
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

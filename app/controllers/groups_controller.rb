class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    
  end

  def create
    Group.create(group_params)
  end

  private
  def group_params
    params.permit(:name)
  end

end

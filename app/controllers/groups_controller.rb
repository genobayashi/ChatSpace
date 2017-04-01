class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]
  before_action :set_users, except: [:index, :ajax_user_list]
  before_action :set_users_except_current_user, only: [:edit]

  def index
    @groups = current_user.groups
  end

  def ajax_user_list
    @user = User.where('nickname LIKE ?', "%#{params[:user_nickname]}%").where.not(id: current_user.id).order(:nickname)
    render 'user_list', formats: [:json], handlers: [:jbuilder]
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました。'
    else
      flash.now[:alert] = 'グループが作成されませんでした。'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました。'
    else
      flash.now[:alert] = 'グループの更新に失敗しました'
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_users
    @users = User.all
  end

  def set_users_except_current_user
    @other_users = @group.users.where.not(id: current_user.id)
  end
end

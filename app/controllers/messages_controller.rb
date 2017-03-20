class MessagesController < ApplicationController

  before_action :group_instance

  def index

  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      flash.now[:alert] = 'メッセージの投稿に失敗しました。'
      render :index
    end
  end

  private
  def message_params
    params[:user_id] = current_user.id
    params.permit(:body, :image, :group_id, :user_id)
  end

  def group_instance
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

end

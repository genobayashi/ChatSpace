class MessagesController < ApplicationController

  before_action :group_instance

  def index
    @messages = @group.messages.includes(:user)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, :group_id, :user_id).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def group_instance
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

end

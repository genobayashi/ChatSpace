class MessagesController < ApplicationController

  before_action :set_group
  before_action :set_groups
  before_action :set_messages


  def index
    @message = Message.new
    respond_to do |format|
      format.html
      format.json { render "update_message.json.jbuilder" }
    end
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(group) }
        format.json { render "message_index.json.jbuilder"}
      end
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_groups
    @groups = current_user.groups.includes(:messages)
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end

end

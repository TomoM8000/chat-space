class MessagesController < ApplicationController
  before_action :set_group

  def index
    @messages = Message.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end

    private
    def message_params
      params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    end
  
    def set_group
      binding.pry
      @group = Group.find_by(params[:group_id])
    end
  end
end

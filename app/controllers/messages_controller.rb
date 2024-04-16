class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message = @chat_room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to @chat_room
    else
      render 'chat_rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
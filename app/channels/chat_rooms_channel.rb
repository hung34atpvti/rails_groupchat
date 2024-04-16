class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    chat_room = ChatRoom.find(params[:chat_room_id])
    stream_from chat_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chat_rooms = ChatRoom.all
    @chat_room = ChatRoom.new
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find(params[:id])
    @message = Message.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      redirect_to chat_rooms_path
    else
      @chat_rooms = ChatRoom.all
      render :index
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
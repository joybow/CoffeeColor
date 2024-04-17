class ChatRoomsController < ApplicationController
  def create
    # ログインユーザーの所属するチャットルームを全件配列で取得
    current_users_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map do |chat_room_user|
      chat_room_user.chat_room
    end
    # パラメーターで与えられたuser_idのユーザーとログインユーザーが所属するチャットルームを配列で取得し、インデックスで要素を取り出す
    @chats = ChatRoomUser.where(chat_room_id: current_users_chat_rooms,user_id: params[:user_id])
    if @chats.present?
      chat_room = @chats[0].chat_room
    # 条件に合うチャットルームが存在しない場合は、チャットルームを新規作成
    elsif chat_room.blank?
      chat_room = ChatRoom.create
      ChatRoomUser.create(user_id: current_user.id, chat_room_id: chat_room.id)
      ChatRoomUser.create(user_id: params[:user_id], chat_room_id: chat_room.id)
    end
    redirect_to chat_room_path(chat_room)
  end

  def index
    @chat = ChatRoom.all
  end
  
  def show
    @chat_message = ChatMessage.new
    @chat_room = ChatRoom.find(params[:id])
    @chat_messages = ChatMessage.where(chat_room: @chat_room).order(created_at: :asc)
    @last_message = @chat_messages.last.created_at
    @image = current_user.user_image
    @chat_room_user = @chat_room.chat_room_users.where.not(user_id: current_user.id)[0].user
    @other_image = @chat_room_user.user_image
    @other_message = @chat_room.chat_messages.where.not(user_id: current_user.id).order(created_at: :asc)
    @last_other_message = @other_message.last.created_at
  end
end

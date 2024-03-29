class ChatRoomsController < ApplicationController
  def create
    # ログインユーザーの所属するチャットルームを全件配列で取得
    current_users_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map do |chat_room_user|
      chat_room_user.chat_room
    end
    # パラメーターで与えられたuser_idのユーザーとログインユーザーが所属するチャットルームを配列で取得し、インデックスで要素を取り出す
    chat_check = ChatRoomUser.find_by(chat_room_id: current_users_chat_rooms, user_id: params[:user_id])
    chat_room = chat_check.chat_room if chat_check

    # 条件に合うチャットルームが存在しない場合は、チャットルームを新規作成
    if chat_room.blank?
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
    @chat_messages = ChatMessage.where(chat_room: @chat_room)
    @chat_room_user = @chat_room.chat_room_users.where.not(user_id: current_user.id)[0].user
  end
end

class ChatMessagesController < ApplicationController
  def create
    # フォームから受け取った値でチャットルームオブジェクトを取得
    @chat_room = ChatRoom.find(params[:chat_message][:chat_room_id])
    # フォームから受け取った値で、チャットメッセージオブジェクトを作成
    @chat_message = ChatMessage.new(user_id: current_user.id, chat_room_id: @chat_room.id, content: params[:chat_message][:content])
    # 保存に成功したら、フラッシュメッセージを表示し、チャットルームへリダイレクトする。
    if @chat_message.save
      
      redirect_to chat_room_path(@chat_room)
    else
      flash[:alert] = "メッセージ送信失敗"
      redirect_to chat_room_path(@chat_room)
    end
  end
end

def destroy
  @chat_message = ChatMessage.find(params[:id])
  byebug
  @chat_room = @chat_message.chat_room
  @chat_message.destroy
  redirect_back(fallback_location: root_path)
end
class ChatRoom < ApplicationRecord
  has_many :chat_room_users
  has_many :users, through: :chat_room_users
  # チャットメッセージの関係 :多
  has_many :chat_messages
end

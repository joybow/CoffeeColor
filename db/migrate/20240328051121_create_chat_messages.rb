class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.integer :chat_room_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end

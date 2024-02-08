class Post < ApplicationRecord
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  has_many_attached :post_images
  has_many :comments, dependent: :destroy
  # 通知機能
  has_many :notifications, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.ransackable_attributes(auth_object = nil)
    auth_object ? super : %w(content title)
  end

  def self.ransackable_associations(auth_object = nil)
    auth_object ? super : %w[name]
  end

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

end

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
end

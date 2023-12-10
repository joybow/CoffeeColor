class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many_attached :post_images


  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end

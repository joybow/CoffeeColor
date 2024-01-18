class Post < ApplicationRecord
  belongs_to :user 
  has_many :favorites, dependent: :destroy
  has_many_attached :post_images
  has_many :comments, dependent: :destroy


  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.searchable_attributes
    %w[title content]
  end


  def self.ransackable_attributes(auth_object = nil)
    ["title", "content"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

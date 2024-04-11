class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  # adminからのtagづけ
  has_many :admin_tags, dependent: :destroy
  has_one :admin, through: :admin_tags
end

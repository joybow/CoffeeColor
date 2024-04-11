class Dashboard::Tag < ApplicationRecord
  has_many :admin_tags, dependent: :destroy
  has_one :admin, through: :admin_tags
end
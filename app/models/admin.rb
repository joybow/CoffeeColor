class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :admin_tags, dependent: :destroy
  has_many :tags, through: :admin_tag
end

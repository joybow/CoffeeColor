class Dashboard::AdminTag < ApplicationRecord
  belongs_to :admin
  belongs_to :tag
end

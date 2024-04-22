class ChangePostIdToBigintInFavorites < ActiveRecord::Migration[6.1]
  def change
    change_column :favorites, :post_id, :bigint
  end
end

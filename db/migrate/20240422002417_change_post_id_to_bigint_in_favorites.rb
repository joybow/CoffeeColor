class ChangePostIdToBigintInFavorites < ActiveRecord::Migration[6.1]
  def up
    change_column :favorites, :post_id, :bigint
  end

  def down
    change_column :favorites, :post_id, :integer
  end
end

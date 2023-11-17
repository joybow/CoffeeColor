class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :coffee_name
      t.integer :coffee_from
      t.integer :review
      t.string :coffee_color
      
      
      t.timestamps
    end
  end
end

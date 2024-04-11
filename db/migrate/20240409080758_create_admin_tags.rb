class CreateAdminTags < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_tags do |t|
      t.string :name
      
      t.timestamps
    end
  end
end

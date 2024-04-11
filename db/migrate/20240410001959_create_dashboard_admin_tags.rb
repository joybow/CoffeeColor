class CreateDashboardAdminTags < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboard_admin_tags do |t|
      t.integer :admin_id, null: false, foreign_key: true
      t.integer :admin_tag_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

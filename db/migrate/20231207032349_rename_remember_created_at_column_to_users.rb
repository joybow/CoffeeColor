class RenameRememberCreatedAtColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :remenber_created_at, :remember_created_at
  end
end

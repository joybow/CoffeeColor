class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.datetime :start_time
      t.string :title
      t.string :content
      t.text :plan
      t.text :place
      t.datetime :end_time
      t.integer :user_id
      t.timestamps
    end
  end
end

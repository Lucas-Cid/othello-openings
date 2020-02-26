class CreateConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :configurations do |t|
      t.integer :response_time, default: 1
      t.integer :priority_level, default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end

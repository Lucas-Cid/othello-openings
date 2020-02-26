class CreateOpenings < ActiveRecord::Migration[5.2]
  def change
    create_table :openings do |t|
      t.string :name
      t.string :move_sequence
      t.integer :playing_count, default: 0
      t.integer :correct_answers_count, default: 0
      t.integer :user_id
      t.integer :priority, default: 0
      t.integer :play_color
      t.timestamps
    end
  end
end

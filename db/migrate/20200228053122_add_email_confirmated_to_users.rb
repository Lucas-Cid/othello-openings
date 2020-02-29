class AddEmailConfirmatedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :emailConfirmated, :boolean, default: false
  end
end

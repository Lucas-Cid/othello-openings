class AddConfirmationTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmationToken, :string
  end
end

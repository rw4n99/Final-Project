class AddLasttNameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :lastname, :string
  end
end

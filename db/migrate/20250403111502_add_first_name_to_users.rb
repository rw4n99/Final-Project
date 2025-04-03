class AddFirstNameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :firstname, :string
  end
end

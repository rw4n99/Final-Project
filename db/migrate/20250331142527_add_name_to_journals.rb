class AddNameToJournals < ActiveRecord::Migration[7.2]
  def change
    add_column :journals, :fieldname, :string
  end
end

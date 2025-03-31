class AddLinkToJournals < ActiveRecord::Migration[7.2]
  def change
    add_column :journals, :link, :string
  end
end

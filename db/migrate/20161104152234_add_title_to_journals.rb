class AddTitleToJournals < ActiveRecord::Migration[5.0]
  def change
    add_column :journals, :group_id, :integer
    add_column :journals, :title, :string
    add_index :journals, :group_id
  end
end

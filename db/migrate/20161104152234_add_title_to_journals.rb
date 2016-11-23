class AddTitleToJournals < ActiveRecord::Migration[5.0]
  def change
    add_column :journals, :title, :string
  end
end

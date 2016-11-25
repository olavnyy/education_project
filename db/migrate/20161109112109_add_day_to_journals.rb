class AddDayToJournals < ActiveRecord::Migration[5.0]
  def change
    add_column :journals, :day, :datetime
    remove_column :journals, :title, :string
  end
end

class AddDayToJournals < ActiveRecord::Migration[5.0]
  def change
    add_column :journals, :day, :datetime
    remove_column :journals, :title, :string
    change_table :journals do |t|
      t.belongs_to :student, index: true

    end
  end
end

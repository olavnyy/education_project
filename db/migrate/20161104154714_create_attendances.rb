class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.date :time
      t.boolean :present, :default => false
      t.belongs_to :journal, index: true
      t.belongs_to :student, index: true
      t.timestamps
    end
  end
end

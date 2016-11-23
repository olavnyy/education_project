class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.date :time
      t.boolean :present, :default => false
      t.timestamps
    end
  end
end

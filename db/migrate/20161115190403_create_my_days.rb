class CreateMyDays < ActiveRecord::Migration[5.0]
  def change
    create_table :my_days do |t|
      t.text :description

      t.timestamps
    end
    add_reference :my_days, :student, index: true, foreign_key: true
    add_reference :my_days, :daily_report, index: true, foreign_key: true
  end
end

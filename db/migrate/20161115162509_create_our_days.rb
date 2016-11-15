class CreateOurDays < ActiveRecord::Migration[5.0]
  def change
    create_table :our_days do |t|
      t.text :description

      t.timestamps
    end
    add_reference :our_days, :student, index: true, foreign_key: true
    add_reference :our_days, :group, index: true, foreign_key: true
    add_reference :our_days, :daily_report, index: true, foreign_key: true
  end
end

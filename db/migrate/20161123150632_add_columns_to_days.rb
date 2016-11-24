class AddColumnsToDays < ActiveRecord::Migration[5.0]
  def change
    add_column :my_days, :day, :date
    add_column :our_days, :day, :date
  end
end

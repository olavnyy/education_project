class ChangeBackColumnReport < ActiveRecord::Migration[5.0]
  def change
    change_table :report_times do |t|
      t.change :start, :time
      t.change :end, :time
    end

  end
end

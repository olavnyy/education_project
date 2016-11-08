class ChangeColumnReportTime < ActiveRecord::Migration[5.0]
  def change
    change_table :report_times do |t|
      t.change :start, :datetime
      t.change :end, :datetime
    end
  end
end

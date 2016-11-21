class ChangeDailyReportDate < ActiveRecord::Migration[5.0]
  def change
    change_table :daily_reports do |t|
      t.change :day, :date
    end
  end
end

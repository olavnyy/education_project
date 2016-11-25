class AddReferencesToDailyReports < ActiveRecord::Migration[5.0]
  def change
    add_reference :daily_reports, :group, index: true, foreign_key: true
    add_reference :daily_reports, :student, index: true, foreign_key: true
    add_reference :attendances, :student, index: true, foreign_key: true
    add_reference :attendances, :group, index: true, foreign_key: true
    add_reference :attendances, :daily_report, index: true, foreign_key: true
  end
end

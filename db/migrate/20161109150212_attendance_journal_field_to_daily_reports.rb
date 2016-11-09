class AttendanceJournalFieldToDailyReports < ActiveRecord::Migration[5.0]
  def change
    rename_column :attendances, :journal_id, :daily_report_id
  end
end

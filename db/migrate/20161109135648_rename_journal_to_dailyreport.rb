class RenameJournalToDailyreport < ActiveRecord::Migration[5.0]
  def change
    rename_table :journals, :daily_reports
  end
end

class AddStudentIndexToDailyReports < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_reports, :student_id, :integer
    add_index :daily_reports, :student_id
  end
end

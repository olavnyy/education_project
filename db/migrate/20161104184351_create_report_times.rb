class CreateReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_times do |t|
      t.time :start
      t.time :end
      t.belongs_to :attendance, index: true
      t.timestamps
    end
  end
end

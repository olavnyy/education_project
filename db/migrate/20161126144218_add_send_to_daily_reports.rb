class AddSendToDailyReports < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_reports, :sended, :boolean
  end
end

class Attendance < ApplicationRecord
  belongs_to :daily_report
  belongs_to :student
  belongs_to :group
  has_many :report_times
  accepts_nested_attributes_for :report_times
  validates_associated :report_times

  after_save :generate_daily_report

  private
  def generate_daily_report
    daily_report || self.create_daily_report(group: group, day: time, student: student)
  end
end


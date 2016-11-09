class Attendance < ApplicationRecord
  belongs_to :daily_report
  belongs_to :student
  belongs_to :group
  has_many :report_times
  accepts_nested_attributes_for :report_times
  validates_associated :report_times
end

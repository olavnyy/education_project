class Attendance < ApplicationRecord
  has_many :report_times
  belongs_to :journal
  belongs_to :student
  accepts_nested_attributes_for :report_times, allow_destroy: true
end

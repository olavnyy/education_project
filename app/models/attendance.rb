class Attendance < ApplicationRecord
  has_many :report_times
  belongs_to :journal
  belongs_to :student
end

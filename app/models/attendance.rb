class Attendance < ApplicationRecord
  belongs_to :journal
  belongs_to :student
end

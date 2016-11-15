class OurDay < ApplicationRecord
  belongs_to :student
  belongs_to :group
  belongs_to :daily_report
end

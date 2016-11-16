class DailyReport < ApplicationRecord
  belongs_to :group
  belongs_to :student
  has_one :attendance, dependent: :destroy
end

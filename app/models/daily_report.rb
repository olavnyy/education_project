class DailyReport < ApplicationRecord
  belongs_to :group
  belongs_to :student
  has_one :attendance, dependent: :destroy
  has_one :my_day, dependent: :destroy
  has_one :our_day, dependent: :destroy
end

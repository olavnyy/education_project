class DailyReport < ApplicationRecord
  belongs_to :group
  belongs_to :student
  has_many :attendances, dependent: :destroy
  has_many :my_days, dependent: :destroy
  has_one :our_day, dependent: :destroy
end

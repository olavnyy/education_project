class DailyReport < ApplicationRecord
  belongs_to :group
  belongs_to :student
  has_many :attendances, dependent: :destroy
end

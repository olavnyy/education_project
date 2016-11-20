class MyDay < ApplicationRecord
  belongs_to :student
  belongs_to :daily_report
  has_many :photos, dependent: :destroy
end

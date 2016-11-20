class OurDay < ApplicationRecord
  belongs_to :group
  belongs_to :daily_report
  has_many :photos, dependent: :destroy
end

class Group < ApplicationRecord
  belongs_to :school
  belongs_to :level
  has_many :students
  has_one :teacher
  has_many :daily_report
  has_many :attendances
  has_many :our_days, dependent: :destroy

  has_many :albums, as: :imageable
  has_many :news, as: :viewable

  validates :name, presence: true, length: {maximum: 10}

end

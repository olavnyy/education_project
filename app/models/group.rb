class Group < ApplicationRecord
  belongs_to :school
  belongs_to :level
  has_many :students
  has_one :teacher

  validates :name, presence: true, length: {maximum: 10}
end

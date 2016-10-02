class Level < ApplicationRecord
  belongs_to :school
  has_many :groups

  validates :name, presence: true, length: {maximum: 10}
end

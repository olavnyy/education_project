class Journal < ApplicationRecord
  belongs_to :group
  belongs_to :student
  has_many :attendances, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: {maximum: 25}
end

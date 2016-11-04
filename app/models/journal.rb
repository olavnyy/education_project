class Journal < ApplicationRecord
  belongs_to :group
  has_many :attendances, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: {maximum: 25}
end

class Album < ApplicationRecord
  belongs_to :school
  belongs_to :imageable, polymorphic: true
  has_many :photos, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: {maximum: 25}

end

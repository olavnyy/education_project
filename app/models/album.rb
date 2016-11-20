class Album < ApplicationRecord
  belongs_to :school
  belongs_to :imageable, polymorphic: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  validates :title, presence: true, length: {maximum: 25}, uniqueness: { scope: :imageable_id }

end

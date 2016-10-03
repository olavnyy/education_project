class Album < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_many :photos, dependent: :destroy

  validates :title, presence: true

end

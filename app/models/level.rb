class Level < ApplicationRecord
  belongs_to :school
  has_many :groups
  has_many :albums, as: :imageable
  has_many :news, as: :viewable

  validates :name, presence: true, length: {maximum: 10}

end

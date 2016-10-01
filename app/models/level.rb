class Level < ApplicationRecord
  belongs_to :school
  has_many :groups
  has_many :albums, as: :imageable
end

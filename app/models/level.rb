class Level < ApplicationRecord
  belongs_to :school
  has_many :groups
end

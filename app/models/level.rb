class Level < ApplicationRecord
  belongs_to :school
  has_many :groups
  has_many :news, as: :viewable
end

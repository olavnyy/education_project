class School < ApplicationRecord
  belongs_to :superadmin
  has_one :admin, dependent: :destroy
  has_many :parents, dependent: :destroy
  has_many :teachers, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :levels, dependent: :destroy
end

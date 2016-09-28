class Student < ApplicationRecord
  belongs_to :school
  belongs_to :group
  has_and_belongs_to_many :parents, join_table: "parents_students"
end

class Student < ApplicationRecord
  belongs_to :school
  belongs_to :group
  has_and_belongs_to_many :parents, class_name: "Parent"
  has_one :health_info

  accepts_nested_attributes_for :health_info
end

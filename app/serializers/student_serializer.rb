# Define StudentSerializer class
class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,
             :age, :group_id, :school_id

  belongs_to :school
  belongs_to :group
  has_one :health_info
  has_and_belongs_to_many :parents, class_name: 'Parent'
end

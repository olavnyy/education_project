# Define the HealthInfoSerializer class
class HealthInfoSerializer < ActiveModel::Serializer
  attributes :id, :health_problem, :description, :student_id

  belongs_to :student
end

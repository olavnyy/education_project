# Define the HealthInfoSerializer class
class HealthInfoSerializer < ActiveModel::Serializer
  attributes :id, :health_problem, :description, :student_id
end

# Define Health_info model for Student model
class HealthInfo < ApplicationRecord
  belongs_to :student
end

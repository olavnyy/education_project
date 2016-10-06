# Define the Teacher model
class Teacher < User
  belongs_to :school
  belongs_to :group
end

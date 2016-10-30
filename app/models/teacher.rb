# Define the Teacher model
class Teacher < User
  belongs_to :school
  belongs_to :group

  scope :schools_list, ->(user) { School.where(id: user.school_id) }
  scope :levels_list, ->(user) { Level.where(id: Group.where(id: user.group_id).select(:level_id)) }
  scope :groups_list, ->(user) { Group.where(id: user.group_id) }
  scope :students_list, ->(user) { Student.where(group_id: user.group_id) }
end

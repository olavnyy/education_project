class Parent < User
  belongs_to :school
  has_and_belongs_to_many :students

  scope :students_list, ->(user) { user.students }
  scope :schools_list, ->(user) { School.where(id: user.school_id) }
  scope :levels_list, ->(user) { Level.where(id: Group.where(id: user.students.select(:group_id)).select(:level_id)) }
  scope :groups_list, ->(user) { Group.where(id: user.students.select(:group_id)) }
  scope :teachers_list, ->(user) { Teacher.where(group_id: Group.where(id: user.students.select(:group_id))) }
end

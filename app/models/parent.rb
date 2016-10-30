class Parent < User
  belongs_to :school
  has_and_belongs_to_many :students

  scope :students_list, ->(user) { user.students }
  scope :schools_list, ->(user) { School.where(id: user.school_id) }
#  scope :levels_list, ->(user) { Level.where(school_id: user.school_id) }
#  scope :groups_list, ->(user) { Group.where(school_id: user.school_id) }
end

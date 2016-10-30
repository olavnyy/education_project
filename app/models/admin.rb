class Admin < User
  belongs_to :school

  scope :schools_list, ->(user) { School.where(id: user.school_id) }
  scope :levels_list, ->(user) { Level.where(school_id: user.school_id) }
  scope :groups_list, ->(user) { Group.where(school_id: user.school_id) }
  scope :students_list, ->(user) { Student.where(school_id: user.school_id) }
  scope :parents_list, ->(user) { Parent.where(school_id: user.school_id) }
  scope :teachers_list, ->(user) { Teacher.where(school_id: user.school_id) }
  scope :news_list, ->(user) { News.where(viewable_type: "School", viewable_id: user.school_id) }

end

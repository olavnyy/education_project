class Admin < User
  belongs_to :school

  scope :students_list, ->(user) { Student.where(school_id: user.school_id) }
  scope :levels_list, ->(user) { Level.where(school_id: user.school_id) }

end

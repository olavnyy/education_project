class Admin < User
  belongs_to :school

  scope :levels_list, ->(user) { Level.where(school_id: user.school_id) }
  scope :groups_list, ->(user) { Group.where(school_id: user.school_id) }
  scope :students_list, ->(user) { Student.where(school_id: user.school_id) }
  scope :parents_list, ->(user) { Parent.where(school_id: user.school_id) }
  scope :teachers_list, ->(user) { Teacher.where(school_id: user.school_id) }
  scope :news_list, ->(user) { News.where(QUERY, school_id: user.school_id)}
  scope :albums_list, ->(user) { Album.where(QUERY, school_id: user.school_id)}

  QUERY = "(imageable_type = 'School' AND
            imageable_id = :school_id)
        OR (imageable_type = 'Level' AND
            imageable_id IN (SELECT id FROM levels
                            WHERE levels.school_id = :school_id))
        OR (imageable_type = 'Group' AND
            imageable_id IN (SELECT id FROM groups
                            WHERE groups.school_id = :school_id))"
end

class Parent < User
  belongs_to :school
  has_and_belongs_to_many :students

  scope :students_list, ->(user) { user.students }

  scope :news_list, ->(user) { News.where(QUERY, school_id: user.school_id)}
  # scope :albums_list, ->(user) { Album.where(QUERY, school_id: user.school_id,
  #                                   groups_id: user.students.with_group.map(&:group).map(&:level).collect { |l| l.try(:id))}}
  # user.students.with_group.map(&:group).map(&:level).collect { |l| l.try(:id))}

  QUERY = "(imageable_type = 'School' AND
            imageable_id = :school_id)
        OR (imageable_type = 'Level' AND
            imageable_id IN (SELECT DISTINCT level_id FROM groups
                             WHERE groups.id IN (SELECT DISTINCT s.group_id
                                                 FROM students s JOIN students_users su
                                                 ON s.id = su.student_id
                                                 JOIN users u ON su.parent_id = u.id)))
        OR (imageable_type = 'Group' AND
            imageable_id IN (SELECT DISTINCT s.group_id
                                FROM students s JOIN students_users su
                                ON s.id = su.student_id
                                JOIN users u ON su.parent_id = u.id))"
end

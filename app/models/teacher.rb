# Define the Teacher model
class Teacher < User
  belongs_to :school
  belongs_to :group

  scope :students_list, ->(user) { Student.where(group_id: user.group_id) }
  scope :parents_list, ->(user) { Student.where(group_id: user.group_id).parents }
  scope :news_list, ->(user) { News.where(QUERY, school_id: user.school_id,
                                                 group_id: user.group_id)}
  scope :albums_list, ->(user) { Album.where(QUERY, school_id: user.school_id,
                                                    group_id: user.group_id)}

  QUERY = "(imageable_type = 'School' AND
            imageable_id = :school_id)
        OR (imageable_type = 'Level' AND
            imageable_id = (SELECT level_id FROM groups
                            WHERE groups.id = :group_id))
        OR (imageable_type = 'Group' AND
            imageable_id = :group_id)"
end

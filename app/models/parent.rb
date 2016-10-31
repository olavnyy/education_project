class Parent < User
  belongs_to :school
  has_and_belongs_to_many :students

  scope :students_list, ->(user) { user.students }

  # scope :news_list, ->(user) { News.where(QUERY, school_id: user.school_id,
  #                                   group_id: user.students.select(:group_id))}
  # scope :albums_list, ->(user) { Album.where(QUERY, school_id: user.school_id,
  #                                   groups_id: user.students.with_group.map(&:group).map(&:level).collect { |l| l.try(:id))}
  # scope :groups_id_list, ->(user) { user.students.select(:group_id).distinct }
  # user.students.with_group.map(&:group).map(&:level).collect { |l| l.try(:id))

  # QUERY = "(imageable_type = 'School' AND
  #           imageable_id = :school_id)
  #       OR (imageable_type = 'Level' AND
  #           imageable_id IN (SELECT level_id FROM groups
  #                           WHERE groups.id IN :groups_id))
  #       OR (imageable_type = 'Group' AND
  #           imageable_id IN :groups_id)"
end

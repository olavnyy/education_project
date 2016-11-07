class Parent < User
  belongs_to :school
  has_and_belongs_to_many :students

  scope :students_list, ->(user) { user.students }
  scope :news_list, ->(user) { News.where(QUERY,
                                          school_id: user.school_id,
                                          level_ids: Parent.students_level_ids(user),
                                          group_ids: Parent.students_group_ids(user)
                                          )
                             }
  scope :albums_list, ->(user) { Album.where(QUERY,
                                          school_id: user.school_id,
                                          level_ids: Parent.students_level_ids(user),
                                          group_ids: Parent.students_group_ids(user)
                                          )
                               }

  private
  
  def self.students_level_ids(user)
    user.students.map(&:group).pluck(:level_id)
  end

  def self.students_group_ids(user)
    user.students.pluck(:group_id)
  end
end

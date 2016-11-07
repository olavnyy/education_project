# Define the Teacher model
class Teacher < User
  include Selectable

  belongs_to :school
  belongs_to :group

  scope :students_list, ->(user) { Student.where(group_id: user.group_id,
                                                 school_id: user.school_id) }
  scope :parents_list, ->(user) { Student.where(group_id: user.group_id,
                                                school_id: user.school_id).parents }
  scope :news_list, ->(user) { News.where(QUERY,
                                          school_id: user.school_id,
                                          level_ids: user.group.level_id,
                                          group_ids: user.group_id
                                          )
                              }
  scope :albums_list, ->(user) { Album.where(QUERY,
                                             school_id: user.school_id,
                                             level_ids: user.group.level_id,
                                             group_ids: user.group_id
                                             )
                               }
end

class Admin < User
  include Selectable

  belongs_to :school

  scope :levels_list, ->(user) { Level.where(school_id: user.school_id) }
  scope :groups_list, ->(user) { Group.where(school_id: user.school_id) }
  scope :students_list, ->(user) { Student.where(school_id: user.school_id) }
  scope :parents_list, ->(user) { Parent.where(school_id: user.school_id) }
  scope :teachers_list, ->(user) { Teacher.where(school_id: user.school_id) }
  scope :news_list, ->(user) { News.where(QUERY,
                                          school_id: user.school_id,
                                          level_ids: Admin.admin_level_ids(user),
                                          group_ids: Admin.admin_group_ids(user)) }
  scope :albums_list, ->(user) { Album.where(QUERY,
                                             school_id: user.school_id,
                                             level_ids: Admin.admin_level_ids(user),
                                             group_ids: Admin.admin_group_ids(user)) }

  private

  def self.admin_level_ids(user)
    user.school.levels.pluck(:id)
  end

  def self.admin_group_ids(user)
    user.school.groups.pluck(:id)
  end
end

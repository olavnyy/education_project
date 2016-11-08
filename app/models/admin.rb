class Admin < User
  belongs_to :school

  private

  def self.level_ids(user)
    user.school.levels.pluck(:id)
  end

  def self.group_ids(user)
    user.school.groups.pluck(:id)
  end
end

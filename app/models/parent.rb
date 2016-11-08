class Parent < User
  belongs_to :school
  has_and_belongs_to_many :students

  private

  def self.level_ids(user)
    user.students.map(&:group).pluck(:level_id)
  end

  def self.group_ids(user)
    user.students.pluck(:group_id)
  end
end

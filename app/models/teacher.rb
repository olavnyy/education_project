# Define the Teacher model
class Teacher < User
  belongs_to :school
  belongs_to :group
  has_many :students, through: :group

  private

  def self.level_ids(user)
    user.group.level_id
  end

  def self.group_ids(user)
    user.group_id
  end
end

# Define StudentSerializer class
class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,
             :age, :group_id, :school_id, :avatar_url

  has_one :health_info

  def avatar_url
      object.avatar.url(:medium)
  end
end

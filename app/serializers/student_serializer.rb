# Define StudentSerializer class
class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,
             :age, :group_id, :school_id, :avatar_url_medium, :avatar_url_thumb

  has_one :health_info
  has_many :my_days
  has_many :parents


  def avatar_url_medium
   object.avatar.url(:medium)
  end

  def avatar_url_thumb
   object.avatar.url(:thumb)
  end
end

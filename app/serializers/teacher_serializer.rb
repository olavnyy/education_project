# Define the TeacherSerializer class
class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email,
             :contact_phone, :school_id, :group_id

  belongs_to :school
  belongs_to :group
end

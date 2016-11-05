# Define the TeacherSerializer class
class TeacherSerializer < UserSerializer
  attributes :id, :first_name, :last_name, :email,
             :contact_phone, :school_id, :group_id
end

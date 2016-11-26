# Define AdminSerializer class
class AdminSerializer < UserSerializer
  root 'user'
  attributes :id, :first_name, :last_name, :email,
             :contact_phone, :school_id
  has_one :school
end

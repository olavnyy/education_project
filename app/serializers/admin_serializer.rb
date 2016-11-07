# Define AdminSerializer class
class AdminSerializer < UserSerializer
  attributes :id, :first_name, :last_name, :email,
             :contact_phone, :school_id
end

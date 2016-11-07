class ParentSerializer  < UserSerializer
  attributes :id, :first_name, :last_name, :email,
             :contact_phone, :type
end

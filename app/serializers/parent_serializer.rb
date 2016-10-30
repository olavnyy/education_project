class ParentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email,
             :contact_phone, :school_id
end

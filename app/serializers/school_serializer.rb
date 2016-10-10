class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :contact_phone
end

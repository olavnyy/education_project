class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :school_id
  has_many :students
  has_one :teacher
end

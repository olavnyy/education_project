class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :school_id
  has_many :students
  has_many :our_days
  has_many :my_days
  has_one :teacher
end

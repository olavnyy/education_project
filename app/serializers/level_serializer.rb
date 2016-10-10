class LevelSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :school_id
  embed :ids, include: true
  has_many :groups
end

class NewsSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :description, :created_at, :viewable_type, :viewable_id
end

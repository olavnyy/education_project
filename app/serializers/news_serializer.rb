class NewsSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :description, :created_at, :imageable_type, :imageable_id
end

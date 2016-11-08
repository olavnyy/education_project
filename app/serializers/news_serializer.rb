class NewsSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :description, :image, :created_at, :imageable_type, :imageable_id
end

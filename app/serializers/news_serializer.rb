class NewsSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :description, :image_url_medium, :created_at, :imageable_type, :imageable_id

  def image_url_medium
   object.image.url(:medium)
  end

  def image_url_thumb
   object.image.url(:thumb)
  end
end

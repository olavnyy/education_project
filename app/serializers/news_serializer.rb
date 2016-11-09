class NewsSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one :user
  attributes :id, :title, :description, :image_url_medium, :created_at, :imageable_type, :imageable_id, :user_id

  def image_url_medium
   object.image.url(:medium)
  end

  def image_url_thumb
   object.image.url(:thumb)
  end
end

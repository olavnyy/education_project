class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :album_id, :image, :image_url_medium, :image_url_thumb, :image_url_large
  has_one :album

  def image_url_medium
    object.image.url(:medium)
  end

  def image_url_thumb
    object.image.url(:thumb)
  end

  def image_url_large
    object.image.url(:large)
  end
end

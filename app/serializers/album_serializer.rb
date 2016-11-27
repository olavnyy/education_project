class AlbumSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :image, :created_at, :imageable_type, :imageable_id, :album_cover
  has_many :photos

  def album_cover
      object.photos.first.image.url(:large)
  end

end

class AlbumSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :image, :created_at, :imageable_type, :imageable_id
  has_many :photos

end

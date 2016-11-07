class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image, :album_id
  #has_one :album
end

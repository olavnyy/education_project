class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email,
             :contact_phone, :type, :avatar_url_medium, :avatar_url_thumb

  def avatar_url_medium
    object.avatar.url(:medium)
  end

  def avatar_url_thumb
    object.avatar.url(:thumb)
  end
end

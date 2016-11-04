class JournalSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :group
end

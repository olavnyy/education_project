class OurDaySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :description, :group_id, :daily_report_id
  has_many :photos
end

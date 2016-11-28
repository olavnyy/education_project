class OurDaySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :description, :created_at, :group_id, :daily_report_id, :day
  has_many :photos
end

class MyDaySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :description, :student_id, :daily_report_id
  has_many :photos
end

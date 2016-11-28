class DailyReportSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :id, :title
  has_one :attendance
  has_one :my_day
  has_one :our_day
  attributes :id, :day, :sended
  has_one :attendance

end

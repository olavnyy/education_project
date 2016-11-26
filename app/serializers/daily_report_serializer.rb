class DailyReportSerializer < ActiveModel::Serializer
  attributes :id, :day, :sended
  has_one :attendance
end

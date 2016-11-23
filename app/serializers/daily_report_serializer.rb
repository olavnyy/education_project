class DailyReportSerializer < ActiveModel::Serializer
  attributes :id
  has_one :attendance
end

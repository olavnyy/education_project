class DailyReportSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :attendance
  has_one :my_day
  has_one :our_day
end

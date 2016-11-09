class DailyReportSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :attendances
end

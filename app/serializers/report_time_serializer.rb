class ReportTimeSerializer < ActiveModel::Serializer
  attributes :id, :start, :end, :attendance_id
end

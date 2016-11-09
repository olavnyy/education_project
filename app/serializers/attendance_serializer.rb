class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :time, :present, :student_id, :daily_report_id, :report_times
  has_one :student
end

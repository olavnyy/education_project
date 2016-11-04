class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :time, :present
end

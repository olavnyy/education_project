class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :time, :present?
  belongs_to :journal
  belongs_to :student
end

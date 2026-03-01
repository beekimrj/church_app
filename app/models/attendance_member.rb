class AttendanceMember < ApplicationRecord
  belongs_to :member
  belongs_to :attendance
  has_one :event, through: :attendance
  has_one :church_service, through: :event
end

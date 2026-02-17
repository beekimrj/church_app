# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  date       :date
#  start_time :time
#  end_time   :time
#  status     :string
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_attendances_on_event_id  (event_id)
#

class Attendance < ApplicationRecord
  enum :status, {
  scheduled: "scheduled",
  completed: "completed",
  cancelled: "cancelled"
}
  belongs_to :event
  has_one :church_service, through: :event
end

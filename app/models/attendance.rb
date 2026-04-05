# frozen_string_literal: true

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
  belongs_to :event
  has_one :church_service, through: :event
  has_many :attendance_members
  has_many :members, through: :attendance_members

  enum :status, {
    scheduled: "scheduled",
    completed: "completed",
    cancelled: "cancelled"
  }

  validates :date, presence: true

  delegate :name, to: :event, prefix: true

  scope :upcomming, -> { where(date: Date.current..) }
  scope :past, -> { where(date: ...Date.current) }
end

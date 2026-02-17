# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  name               :string
#  status             :string
#  start_date         :date
#  end_date           :date
#  church_service_id  :integer          not null
#  code               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  description        :text
#  recurrence         :string
#  default_start_time :time
#  default_end_time   :time
#  capacity           :integer
#
# Indexes
#
#  index_events_on_church_service_id  (church_service_id)
#

class Event < ApplicationRecord
  belongs_to :church_service
  has_many :attendances

  enum :recurrence, {
    once: "once",
    weekly: "weekly",
    monthly: "monthly",
    yearly: "yearly"
  }

  enum :status, {
    active: "active",
    inactive: "inactive"
  }
end

# Pending to add following column

# event_type :string
# examples:
# "regular_service"
# "outreach"
# "training"
# "social"
# "ceremony"

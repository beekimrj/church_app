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
end


# t.string   :name, null: false
# t.text     :description
# t.string   :event_type
# t.string   :recurrence        # none, weekly, yearly
# t.datetime :start_date        # informational
# t.datetime :end_date          # informational
# t.time     :default_start_time
# t.time     :default_end_time
# t.integer  :capacity
# t.boolean  :active, default: true
# t.string   :code
# t.references :church_service, null: false, foreign_key: true
# t.timestamps

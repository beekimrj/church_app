# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  name              :string
#  status            :string
#  start_date        :datetime
#  end_date          :datetime
#  church_service_id :integer          not null
#  code              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_events_on_church_service_id  (church_service_id)
#

class Event < ApplicationRecord
  belongs_to :church_service
end

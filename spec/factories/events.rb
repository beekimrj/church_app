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

FactoryBot.define do
  factory :event do
    name { "MyString" }
    status { "MyString" }
    start_date { "2025-09-27 22:13:13" }
    end_date { "2025-09-27 22:13:13" }
    church_service { nil }
    code { "MyString" }
  end
end

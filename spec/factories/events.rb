# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :string
#  start_date :datetime
#  end_date   :datetime
#  service_id :integer          not null
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_events_on_service_id  (service_id)
#

FactoryBot.define do
  factory :event do
    name { "MyString" }
    status { "MyString" }
    start_date { "2025-09-27 20:09:14" }
    end_date { "2025-09-27 20:09:14" }
    service { nil }
    code { "MyString" }
  end
end

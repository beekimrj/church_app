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

FactoryBot.define do
  factory :attendance do
    event { nil }
    date { "2026-01-31" }
    start_time { "2026-01-31 18:13:48" }
    end_time { "2026-01-31 18:13:48" }
    status { "MyString" }
    note { "MyText" }
  end
end

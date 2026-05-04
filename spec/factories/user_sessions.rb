# == Schema Information
#
# Table name: user_sessions
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  token        :string           not null
#  device_name  :string
#  ip_address   :string
#  user_agent   :string
#  last_used_at :datetime
#  expires_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_user_sessions_on_expires_at  (expires_at)
#  index_user_sessions_on_token       (token) UNIQUE
#  index_user_sessions_on_user_id     (user_id)
#

FactoryBot.define do
  factory :user_session do
    token { "MyString" }
    device_name { "MyString" }
    ip_address { "MyString" }
    user_agent { "MyString" }
    last_used_at { "2026-05-03 18:17:44" }
    expires_at { "2026-05-03 18:17:44" }
    user { nil }
  end
end

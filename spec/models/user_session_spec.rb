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

require 'rails_helper'

RSpec.describe UserSession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

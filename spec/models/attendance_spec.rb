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

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

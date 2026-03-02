# == Schema Information
#
# Table name: attendance_members
#
#  id            :integer          not null, primary key
#  member_id     :integer          not null
#  attendance_id :integer          not null
#  arrived_at    :datetime
#  departed_at   :datetime
#  note          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_attendance_members_on_attendance_id                (attendance_id)
#  index_attendance_members_on_attendance_id_and_member_id  (attendance_id,member_id) UNIQUE
#  index_attendance_members_on_member_id                    (member_id)
#

require 'rails_helper'

RSpec.describe AttendanceMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

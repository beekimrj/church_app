# == Schema Information
#
# Table name: service_group_members
#
#  id               :integer          not null, primary key
#  service_group_id :integer          not null
#  member_id        :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_service_group_members_on_member_id         (member_id)
#  index_service_group_members_on_service_group_id  (service_group_id)
#

require 'rails_helper'

RSpec.describe ServiceGroupMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

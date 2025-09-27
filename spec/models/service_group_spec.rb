# == Schema Information
#
# Table name: service_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ServiceGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  first_name     :string
#  last_name      :string
#  phone_number   :string
#  email          :string
#  date_of_birth  :date
#  code           :string
#  gender         :string
#  marital_status :string
#  baptism_date   :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Member, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

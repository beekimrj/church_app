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
# Indexes
#
#  index_members_on_first_name    (first_name)
#  index_members_on_last_name     (last_name)
#  index_members_on_phone_number  (phone_number)
#

class Member < ApplicationRecord
end

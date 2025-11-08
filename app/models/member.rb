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

class Member < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end
end

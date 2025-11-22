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

class ServiceGroup < ApplicationRecord
  has_many :service_group_members
  has_many :members, through: :service_group_members
  has_many :church_services
end

# == Schema Information
#
# Table name: church_services
#
#  id               :integer          not null, primary key
#  name             :string
#  status           :string
#  service_group_id :integer          not null
#  code             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_church_services_on_service_group_id  (service_group_id)
#

FactoryBot.define do
  factory :church_service do
    name { "MyString" }
    status { "MyString" }
    service_group { nil }
    code { "MyString" }
  end
end

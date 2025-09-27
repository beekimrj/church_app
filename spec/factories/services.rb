# == Schema Information
#
# Table name: services
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
#  index_services_on_service_group_id  (service_group_id)
#

FactoryBot.define do
  factory :service do
    name { "MyString" }
    status { "MyString" }
    service_group { nil }
    code { "MyString" }
  end
end

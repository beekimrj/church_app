# == Schema Information
#
# Table name: church_services
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :church_service do
    name { "MyString" }
    status { "MyString" }
    service_group { nil }
    code { "MyString" }
  end
end

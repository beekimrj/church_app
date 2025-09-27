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

FactoryBot.define do
  factory :member do
    first_name { "MyString" }
    last_name { "MyString" }
    phone_number { "MyString" }
    email { "MyString" }
    date_of_birth { "2025-09-27" }
    code { "MyString" }
    gender { "MyString" }
    marital_status { "MyString" }
    baptism_date { "2025-09-27" }
  end
end

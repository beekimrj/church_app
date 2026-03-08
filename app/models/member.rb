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
  enum :gender, { male: "male", female: "female" }

  enum :marital_status, { single: "single", married: "married", divorced: "divorced", widow: "widow", other: "other" }

  scope :search, -> (search_text) {
    return all if search_text.blank?

    where("first_name ilike :q or last_name ilike :q or email ilike :q or phone_number ilike :q", q: "%#{search_text}%")
  }

  def full_name
    "#{first_name} #{last_name}"
  end
end

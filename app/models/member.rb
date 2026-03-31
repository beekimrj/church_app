# frozen_string_literal: true

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
  has_many :attendance_members
  has_many :attendances, through: :attendance_members
  has_many :events, through: :attendances
  has_many :church_services, through: :events

  enum :gender, { male: "male", female: "female" }
  enum :marital_status, { single: "single", married: "married", divorced: "divorced", widow: "widow", other: "other" }

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :marital_status
  validates_presence_of :gender

  scope :search, -> (search_text) {
    return all if search_text.blank?

    where("first_name ilike :q or last_name ilike :q or email ilike :q or phone_number ilike :q", q: "%#{search_text}%")
  }
  scope :ordered, -> { order(:first_name, :last_name) }

  def full_name
    "#{first_name} #{last_name}"
  end
end

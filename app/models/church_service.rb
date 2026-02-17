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

class ChurchService < ApplicationRecord
  has_many :events
  has_many :attendances, through: :events
end

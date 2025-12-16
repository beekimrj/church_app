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
  belongs_to :service_group
end

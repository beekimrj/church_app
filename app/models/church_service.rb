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

class ChurchService < ApplicationRecord
  belongs_to :service_group
end

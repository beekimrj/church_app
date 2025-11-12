class ServiceGroups::MembersController < ApplicationController
  before_action :set_service_group

  def index
    @members = @service_group.members
  end

  private

  def set_service_group
    @service_group = ServiceGroup.find(params[:service_group_id])
  end
end

class ServiceGroups::MembersController < ApplicationController
  before_action :set_service_group
  before_action :set_member, only: :toggle_membership

  # GET /service_groups/:service_group_id/members
  def index
    @members = @service_group.members.order(:first_name)
  end

  # GET /service_groups/:service_group_id/members/manage_members
  def manage_members
    @members = Member.all.order(:first_name)
    @service_group_member_ids = @service_group.service_group_members.pluck(:member_id)
  end

  # POST /service_groups/:service_group_id/members/toggle_membership
  def toggle_membership
    @member = Member.find(params[:member_id])
    @service_group_member = @service_group.service_group_members.find_by(member_id: @member.id)

    if @service_group_member.present?
      @service_group_member.destroy
    else
      @service_group.service_group_members.create!(member: @member)
    end

    @service_group_member_ids = @service_group.service_group_members.pluck(:member_id)
  end

  private

  def set_service_group
    @service_group = ServiceGroup.find(params[:service_group_id])
  end

  def set_member
    @member = Member.find(params[:member_id])
  end
end

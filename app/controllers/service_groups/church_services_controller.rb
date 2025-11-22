class ServiceGroups::ChurchServicesController < ApplicationController
  before_action :set_service_group
  before_action :set_church_service, only: %i[show edit update]

  def index
    @church_services = @service_group.church_services
  end

  def new
    @church_service = @service_group.church_services.new
  end

  def edit
  end

  def create
    @church_service = @service_group.church_services.new(church_service_params)

    if @church_service.save
      redirect_to service_group_church_services_path(@service_group), notice: "Church Service was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @church_service.update(church_service_params)
      redirect_to service_group_church_services_path(@service_group), notice: "Church Service was successfully Updated."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def show
  end

  private

  def set_service_group
    @service_group = ServiceGroup.find(params[:service_group_id])
  end

  def set_church_service
    @church_service = @service_group.church_services.find(params[:id])
  end

  def church_service_params
    params.expect(church_service: [ :name, :status, :code ])
  end
end

class ServiceGroupsController < ApplicationController
  before_action :set_service_group, only: %i[ show edit update destroy ]

  # GET /service_groups
  def index
    @service_groups = ServiceGroup.all
  end

  # GET /service_groups/1
  def show
  end

  # GET /service_groups/new
  def new
    @service_group = ServiceGroup.new
  end

  # GET /service_groups/1/edit
  def edit
  end

  # POST /service_groups
  def create
    @service_group = ServiceGroup.new(service_group_params)

    if @service_group.save
      redirect_to @service_group, notice: "Service group was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /service_groups/1
  def update
    if @service_group.update(service_group_params)
      redirect_to @service_group, notice: "Service group was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /service_groups/1
  def destroy
    @service_group.destroy!
    redirect_to service_groups_path, notice: "Service group was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_group
      @service_group = ServiceGroup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def service_group_params
      params.expect(service_group: [ :name, :status, :code ])
    end
end

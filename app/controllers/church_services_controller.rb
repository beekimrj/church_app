class ChurchServicesController < ApplicationController
  before_action :set_church_service, only: %i[ show edit update destroy ]

  # GET /church_services
  def index
    @church_services = ChurchService.all
  end

  # GET /church_services/1
  def show
  end

  # GET /church_services/new
  def new
    @church_service = ChurchService.new
  end

  # GET /church_services/1/edit
  def edit
  end

  # POST /church_services
  def create
    @church_service = ChurchService.new(church_service_params)

    if @church_service.save
      redirect_to @church_service, notice: "Church service was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /church_services/1
  def update
    if @church_service.update(church_service_params)
      redirect_to @church_service, notice: "Church service was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /church_services/1
  def destroy
    @church_service.destroy!
    redirect_to church_services_path, notice: "Church service was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church_service
      @church_service = ChurchService.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def church_service_params
      params.expect(church_service: [ :name, :status, :service_group_id, :code ])
    end
end

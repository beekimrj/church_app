class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]
  before_action :set_event

  # GET /attendances
  def index
    @attendances = if @event.present?
      @event.attendances
    else
      Attendance.all
    end
  end

  # GET /attendances/1
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      redirect_to @attendance, notice: "Attendance was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /attendances/1
  def update
    if @attendance.update(attendance_params)
      redirect_to @attendance, notice: "Attendance was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /attendances/1
  def destroy
    @attendance.destroy!
    redirect_to attendances_path, notice: "Attendance was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.expect(attendance: [ :event_id, :date, :start_time, :end_time, :status, :note ])
    end

    def set_event
      @event = Event.find(params[:event_id]) if params[:event_id].present?
    end
end

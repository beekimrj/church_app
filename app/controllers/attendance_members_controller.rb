class AttendanceMembersController < ApplicationController
  before_action :set_attendance_member, only: %i[ show edit update destroy ]

  # GET /attendance_members
  def index
    @attendance_members = AttendanceMember.all
  end

  # GET /attendance_members/1
  def show
  end

  # GET /attendance_members/new
  def new
    @attendance_member = AttendanceMember.new
  end

  # GET /attendance_members/1/edit
  def edit
  end

  # POST /attendance_members
  def create
    @attendance_member = AttendanceMember.new(attendance_member_params)

    if @attendance_member.save
      redirect_to @attendance_member, notice: "Attendance member was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /attendance_members/1
  def update
    if @attendance_member.update(attendance_member_params)
      redirect_to @attendance_member, notice: "Attendance member was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /attendance_members/1
  def destroy
    @attendance_member.destroy!
    redirect_to attendance_members_path, notice: "Attendance member was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_member
      @attendance_member = AttendanceMember.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def attendance_member_params
      params.expect(attendance_member: [ :member_id, :attendance_id, :arrived_at, :departed_at, :note ])
    end
end

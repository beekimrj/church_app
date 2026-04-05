class AttendanceMembersController < ApplicationController
before_action :set_attendance_member, only: %i[ show edit update destroy ]
before_action :set_attendance, only: %i[ index create new]

  # GET /attendance_members
  def index
    @members = filter_members.page(params[:page])
    @attended_members = @attendance.attendance_members.where(member: @members).select(:id, :member_id, :attendance_type).index_by(&:member_id)
  end

  # GET /attendance_members/1
  def show
    @attendance = @attendance_member.attendance
  end

  # GET /attendance_members/new
  def new
    @attendance_member = @attendance.attendance_members.new(attendance_member_params)
    @attendance_member.arrived_at = Time.current
  end

  # GET /attendance_members/1/edit
  def edit
    @attendance = @attendance_member.attendance
  end

  # POST /attendance_members
  def create
    @attendance_member = @attendance.attendance_members.new(attendance_member_params)
    @member = @attendance_member.member

    if @attendance_member.save
      notice_msg = "#{@attendance_member.member.full_name} was successfully marked as Attended."

      respond_to do |format|
        format.html { redirect_to attendance_attendance_members_path(@attendance_member.attendance_id, allowed_query_params), notice: notice_msg }
        format.turbo_stream { flash.now[:notice] = notice_msg }
      end
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
    @member = @attendance_member.member
    @attendance = @attendance_member.attendance
    @attendance_member.destroy!

    warning_msg = "#{@attendance_member.member.full_name} was successfully removed from Attendance"
    respond_to do |format|
        format.html { redirect_to attendance_attendance_members_path(@attendance_member.attendance_id, allowed_query_params), warning: warning_msg, status: :see_other }
        format.turbo_stream { flash.now[:warning] = warning_msg }
      end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance_member
    @attendance_member = AttendanceMember.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def attendance_member_params
    params.expect(attendance_member: [ :member_id, :attendance_id, :arrived_at, :departed_at, :note, :attendance_type ])
  end

  def set_attendance
    @attendance = Attendance.find(params[:attendance_id]) # if params[:attendance_id].present?
  end

  def filter_members
    attendance_status =  params[:status].presence || AttendanceMembersHelper::ATTENDED_STATUS
    @members =
      case attendance_status
      when AttendanceMembersHelper::ATTENDED_STATUS
        @attendance.members
      when AttendanceMembersHelper::UNATTENDED_STATUS
        Member.where.not(id: @attendance.members)
      else
        Member.all
      end

    @members = @members.search(params[:q]) if params[:q].present?
    @members.ordered
  end
end

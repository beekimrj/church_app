class AttendanceMembersController < ApplicationController
before_action :set_attendance_member, only: %i[ show edit update destroy ]
before_action :set_attendance, only: %i[ index create new ]

  # GET /attendance_members
  def index
    @members = filter_members.page(params[:page])
    @attended_member_ids = @attendance.attendance_members.where(member: @members).pluck(:member_id)
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
    @attendance = @attendance_member.attendance
  end

  # POST /attendance_members
  def create
    @attendance_member = AttendanceMember.new(attendance_member_params.merge(arrived_at: Time.current))

    respond_to do |format|
      if @attendance_member.save
        format.html { redirect_to attendance_attendance_members_path(@attendance_member.attendance), notice: "Member marked as attended." }
        format.turbo_stream do
          @members = filter_members.page(params[:page])
          @attended_member_ids = @attendance.attendance_members.where(member: @members).pluck(:member_id)
          render turbo_stream: [
            turbo_stream.replace("attendance_members", partial: "attendance_members/table", locals: { members: @members, attendance: @attendance, attended_member_ids: @attended_member_ids }),
            turbo_stream.replace("flash", partial: "shared/flash_messages")
          ]
        end
      else
        format.html { render :new, status: :unprocessable_content }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("flash", partial: "shared/flash_messages") }
      end
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
    member = @attendance_member.member
    @attendance_member.destroy!
    respond_to do |format|
      format.html { redirect_to attendance_attendance_members_path(@attendance_member.attendance), notice: "Member marked as unattended.", status: :see_other }
      format.turbo_stream do
        @members = filter_members.page(params[:page])
        @attended_member_ids = @attendance.attendance_members.where(member: @members).pluck(:member_id)
        render turbo_stream: [
          turbo_stream.replace("attendance_members", partial: "attendance_members/table", locals: { members: @members, attendance: @attendance, attended_member_ids: @attended_member_ids }),
          turbo_stream.replace("flash", partial: "shared/flash_messages")
        ]
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance_member
    @attendance_member = AttendanceMember.find(params.expect(:id))
    @attendance = @attendance_member.attendance
  end

  # Only allow a list of trusted parameters through.
  def attendance_member_params
    params.expect(attendance_member: [ :member_id, :attendance_id, :arrived_at, :departed_at, :note ])
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

module DashboardService
  DEFAUL_RECORD_COUNT = 5
  extend self

  def active_events
    Event.active.count
  end

  def upcoming_attendances
    Attendance.upcomming.includes(:event).order(:date).limit(DEFAUL_RECORD_COUNT)
  end

  def past_attendances
    Attendance.past.includes(:event).order(date: :desc).limit(DEFAUL_RECORD_COUNT)
  end

  def total_members
    Member.count
  end

  def church_services
    ChurchService.active.count
  end
end

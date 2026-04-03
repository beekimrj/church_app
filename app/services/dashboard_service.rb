module DashboardService
  extend self

  def active_events
    Event.active.count
  end

  def upcoming_attendances
    Attendance.upcomming.includes(:event).order(:date)
  end

  def total_members
    Member.count
  end

  def church_services
    ChurchService.active.count
  end
end

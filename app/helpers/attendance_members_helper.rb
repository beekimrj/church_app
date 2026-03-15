# frozen_string_literal: true

module AttendanceMembersHelper
  ATTENDED_STATUS = "attended"
  UNATTENDED_STATUS = "unattended"
  ALL_STATUS = "all"
  ATTENDANCE_STATUSES = [ ATTENDED_STATUS, UNATTENDED_STATUS, ALL_STATUS ].freeze
  DEFAULT_SELECTED_STATUS = ATTENDED_STATUS

  def attendance_statuses
    ATTENDANCE_STATUSES.map do |status|
      [ status.humanize, status ]
    end
  end
end

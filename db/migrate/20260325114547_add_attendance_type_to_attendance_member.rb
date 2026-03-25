class AddAttendanceTypeToAttendanceMember < ActiveRecord::Migration[8.0]
  def change
    add_column :attendance_members, :attendance_type, :string
  end
end

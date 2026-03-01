class CreateAttendanceMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :attendance_members do |t|
      t.references :member, null: false, foreign_key: true
      t.references :attendance, null: false, foreign_key: true
      t.datetime :arrived_at
      t.datetime :departed_at
      t.string :note

      t.timestamps
    end

    add_index :attendance_members, [:attendance_id, :member_id], unique: true
  end
end

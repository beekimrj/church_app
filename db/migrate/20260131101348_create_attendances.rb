class CreateAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.references :event, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :status
      t.text :note

      t.timestamps
    end
  end
end

class UpdateStartEndDateOfEvents < ActiveRecord::Migration[8.0]
  def up
    change_column :events, :start_date, :date, using: 'start_date::date'
    change_column :events, :end_date, :date, using: 'end_date::date'
  end

  def down
    change_column :events, :start_date, :datetime
    change_column :events, :end_date, :datetime
  end
end

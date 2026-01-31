class AddFieldsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :description, :text
    add_column :events, :recurrence, :string
    add_column :events, :default_start_time, :time
    add_column :events, :default_end_time, :time
    add_column :events, :capacity, :integer
  end
end

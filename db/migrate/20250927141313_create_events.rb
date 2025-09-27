class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.references :church_service, null: false, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end

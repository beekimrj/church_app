class CreateChurchServices < ActiveRecord::Migration[8.0]
  def change
    create_table :church_services do |t|
      t.string :name
      t.string :status
      t.references :service_group, null: false, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end

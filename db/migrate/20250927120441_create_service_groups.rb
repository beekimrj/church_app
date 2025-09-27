class CreateServiceGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :service_groups do |t|
      t.string :name
      t.string :status
      t.string :code

      t.timestamps
    end
  end
end

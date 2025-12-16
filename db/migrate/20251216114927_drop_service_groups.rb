class DropServiceGroups < ActiveRecord::Migration[8.0]
  def up
    drop_table :service_groups
  end

  def down
    create_table :service_groups do |t|
      t.string :name
      t.string :status
      t.string :code

      t.timestamps
    end
  end
end

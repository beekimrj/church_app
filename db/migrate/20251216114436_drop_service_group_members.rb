class DropServiceGroupMembers < ActiveRecord::Migration[8.0]
  def up
    drop_table :service_group_members
  end

  def down
    create_table :service_group_members do |t|
      t.references :service_group, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end

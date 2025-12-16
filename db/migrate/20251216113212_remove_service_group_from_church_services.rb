class RemoveServiceGroupFromChurchServices < ActiveRecord::Migration[8.0]
  def up
    remove_foreign_key :church_services, :service_groups if foreign_key_exists?(:church_services, :service_groups)
    remove_index :church_services, :service_group_id if index_exists?(:church_services, :service_group_id)
    remove_column :church_services, :service_group_id
  end

  def down
    add_column :church_services, :service_group_id, :bigint
    add_index :church_services, :service_group_id
    add_foreign_key :church_services, :service_groups
  end
end

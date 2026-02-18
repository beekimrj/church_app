class UpdateStatusTypeInChurchServices < ActiveRecord::Migration[8.0]
  def change
    remove_column :church_services, :status, :integer
    add_column :church_services, :status, :string
  end
end

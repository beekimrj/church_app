class AddAgeGroupToMembers < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :age_group, :string
    add_index :members, :age_group
  end
end

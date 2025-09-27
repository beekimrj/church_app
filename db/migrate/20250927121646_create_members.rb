class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.date :date_of_birth
      t.string :code
      t.string :gender
      t.string :marital_status
      t.date :baptism_date

      t.timestamps
    end

    add_index :members, :first_name
    add_index :members, :last_name
    add_index :members, :phone_number
  end
end

class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, default: ""
      t.string :password_digest, null: false

      t.string :full_name
      t.string :phone
      t.string :email

      t.integer :failed_attempts, default: 0, null: false
      t.datetime :locked_at
      t.datetime :last_login_at

      t.references :member, foreign_key: true

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true, where: "email IS NOT NULL"
  end
end

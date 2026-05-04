class CreateUserSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :user_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token, null: false

      t.string :device_name
      t.string :ip_address
      t.string :user_agent

      t.datetime :last_used_at
      t.datetime :expires_at

      t.timestamps

      t.index :token, unique: true
      t.index :expires_at
    end
  end
end

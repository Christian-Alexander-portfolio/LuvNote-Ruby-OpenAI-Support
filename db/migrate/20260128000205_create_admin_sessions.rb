class CreateAdminSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :admin_sessions do |t|
      t.string :session_token
      t.datetime :expires_at

      t.timestamps
    end
  end
end

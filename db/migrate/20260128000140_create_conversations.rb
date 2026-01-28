class CreateConversations < ActiveRecord::Migration[8.1]
  def change
    create_table :conversations do |t|
      t.string :visitor_id
      t.datetime :started_at
      t.datetime :last_activity_at
      t.text :user_agent
      t.string :ip_hash

      t.timestamps
    end
  end
end

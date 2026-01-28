class AddIndexToConversationsVisitorId < ActiveRecord::Migration[7.1]
  def change
    add_index :conversations, :visitor_id, unique: true
  end
end

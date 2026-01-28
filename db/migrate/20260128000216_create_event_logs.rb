class CreateEventLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :event_logs do |t|
      t.string :level
      t.string :event_name
      t.jsonb :data_json
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

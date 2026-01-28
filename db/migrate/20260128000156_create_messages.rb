class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.references :conversation, null: false, foreign_key: true
      t.string :role
      t.text :content
      t.string :model
      t.float :confidence
      t.references :chosen_support_page, null: false, foreign_key: true
      t.string :link_type
      t.text :link_url
      t.integer :latency_ms
      t.integer :prompt_tokens
      t.integer :completion_tokens

      t.timestamps
    end
  end
end

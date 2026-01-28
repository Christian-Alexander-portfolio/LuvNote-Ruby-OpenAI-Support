class CreateSupportPages < ActiveRecord::Migration[8.1]
  def change
    create_table :support_pages do |t|
      t.string :slug
      t.string :title
      t.text :summary
      t.text :body_md
      t.string :in_app_url
      t.text :tags

      t.timestamps
    end
  end
end

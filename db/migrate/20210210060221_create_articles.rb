class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :instruction,        null: false
      t.integer :category_id,     null: false
      t.integer :country_id,      null: false
      t.references :user,         null: false, foreign_key: true  

      t.timestamps
    end
  end
end

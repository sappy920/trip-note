class AddCountryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :country, :string
    add_column :articles, :weather, :text
    add_column :articles, :advice, :text
    rename_column :articles, :country_id, :prefecture_id
  end
end

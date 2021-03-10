class AddCountryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :country, :string
    rename_column :articles, :country_id, :prefecture_id
  end
end

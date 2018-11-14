class AddColumnsToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :pub_date, :string
    add_column :articles, :url, :string
  end
end

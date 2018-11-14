class AddColumnToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :article_id, :string
  end
end

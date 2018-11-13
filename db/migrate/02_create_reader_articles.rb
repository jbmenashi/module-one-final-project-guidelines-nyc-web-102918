class CreateReaderArticles < ActiveRecord::Migration
  def change
    create_table :reader_articles do |t|
      t.integer :reader_id
      t.integer :article_id
      t.boolean :is_read
    end
  end
end

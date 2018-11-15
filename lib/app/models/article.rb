class Article < ActiveRecord::Base
  has_many :reader_articles
  has_many :readers, through: :reader_articles

  def self.most_popular_article
    most_readers = 0
    most_popular_article = nil
    Article.all.each do |article|
      if article.readers.count > most_readers
        most_readers = article.readers.count
        most_popular_article = article
      end
    end
    "#{most_popular_article.title} (#{most_popular_article.readers.count})"
  end


end

class Reader < ActiveRecord::Base
  has_many :reader_articles
  has_many :articles, through: :reader_articles

  def unread_articles
    reader_articles.each do |reader_article|
      if reader_article.is_read == false
        puts "Title: #{reader_article.article.title}"
        puts "Publication Date: #{reader_article.article.pub_date}"
        puts "URL: #{reader_article.article.url}"
        puts "Article ID: #{reader_article.article.article_id}"
        puts "*" * 50
        sleep(0.5)
      end
    end
  end

  def option_one_unread
    sleep(1)
    self.unread_articles
    answer = prompt_read_article
    article_id = enter_article_id_to_mark_as_read(answer)
    if article_id
      found_article = Article.find_by(article_id: article_id)
      Launchy.open("#{found_article.url}")
      self.change_unread_to_read(article_id)
    end
  end

  def option_two_read
    sleep(1)
    reader_articles.each do |reader_article|
      if reader_article.is_read == true
        puts "Title: #{reader_article.article.title}"
        puts "Publication Date: #{reader_article.article.pub_date}"
        puts "URL: #{reader_article.article.url}"
        puts "Article ID: #{reader_article.article.article_id}"
        puts "*" * 50
        sleep(0.5)
      end
    end
  end

  def change_unread_to_read(article_id)
    reader_articles.each do |reader_article|
      if reader_article.article.article_id == article_id
        reader_article.is_read = true
        reader_article.save
      end
    end
  end

end

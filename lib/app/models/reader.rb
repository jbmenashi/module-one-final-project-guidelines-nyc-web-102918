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
    system "clear"
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
    system "clear"
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
    answer = prompt_read_article_again
    article_id = enter_article_id_to_read_again(answer)
    if article_id
      found_article = Article.find_by(article_id: article_id)
      Launchy.open("#{found_article.url}")
      self.change_unread_to_read(article_id)
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

  def articles_saved
    self.reader_articles.count
  end

  def articles_read
    read_articles = self.reader_articles.select do |reader_article|
      reader_article.is_read == true
    end
    read_articles.count
  end

  def self.most_avid_reader
    most_articles_read = 0
    most_avid_reader = nil
    Reader.all.each do |reader|
      if reader.articles_read > most_articles_read
        most_articles_read = reader.articles_read
        most_avid_reader = reader
      end
    end
    "#{most_avid_reader.name} (#{most_avid_reader.articles_read})"
  end

  def option_four_stats
    sleep(1)
    puts "*" * 25
    puts "Articles I've Saved: #{articles_saved}"
    puts "Articles I've Read: #{articles_read}"
    puts "Most Avid Reader: #{Reader.most_avid_reader}"
    puts "Most Popular Article: #{Article.most_popular_article}"
    puts "*" * 25
    sleep(25)
  end

end

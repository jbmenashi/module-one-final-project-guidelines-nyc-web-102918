class Article < ActiveRecord::Base
  has_many :reader_articles
  has_many :readers, through: :reader_articles

  def self.search_for_article(query)
    if query.to_i.class != Fixnum
      get_articles_from_api_by_keyword(query)
    elsif query.to_i.class == Fixnum
      get_articles_from_api_by_date(query)
    else
      puts "Invalid search query"
    end
  end

  def self.get_articles_array(search_results)
    search_results["response"]["docs"]
  end

  def self.print_articles(articles_array)
    articles_array.each do |article|
      title = article["headline"]["main"]
      pub_date = article["pub_date"].to_s[0..9]
      url = article["web_url"]

      puts "Title: #{title}"
      puts "Publication Date: #{pub_date}"
      puts "URL: #{url}"
      puts "*" * 50
    end
  end






# #for each article in article hash
# #title = article[title]
#   def pub_date
#
#   end
#
#
#   def url
#
#   end

end

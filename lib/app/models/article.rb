class Article < ActiveRecord::Base
  has_many :reader_articles
  has_many :readers, through: :reader_articles

  def self.search_for_article(query)
    if query.class == String
      get_articles_from_api_by_keyword(query)
    elsif query.class == Integer
      get_articles_from_api_by_date(query)
    else
      puts "Invalid search query"
    end
  end

  def get_individual_article(search_results)
    search_results["response"]["docs"]
  end

  def title(articles_hash)


  def pub_date

  end


  def url

  end

end

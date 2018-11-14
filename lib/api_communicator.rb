require 'net/http'
require 'json'
require 'pry'

def get_articles_from_api_by_keyword(keyword)
  uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "bde86d58cd4a4520896fb536bf7018e6",
    "fl" => "web_url, snippet, headline, keywords, pub_date",
    "q" => keyword
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  @result = JSON.parse(http.request(request).body)
end

def get_articles_from_api_by_date(date)
  uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "bde86d58cd4a4520896fb536bf7018e6",
    "fl" => "web_url, snippet, headline, keywords, pub_date",
    "begin_date" => date
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  @result = JSON.parse(http.request(request).body)
end

binding.pry
0

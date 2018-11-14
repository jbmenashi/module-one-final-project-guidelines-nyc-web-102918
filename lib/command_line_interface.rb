def welcome
  puts "Welcome to the New York Times Archives!"
end

def get_request_from_user
  puts "Please enter a keyword or date:"
  gets.chomp
end

# def search_for_article(query)
#   if query.class == String
#     get_articles_from_api_by_keyword(query)
#   elsif query.class == Integer
#     get_articles_from_api_by_date(query)
#   else
#     puts "Invalid search query"
#   end
# end

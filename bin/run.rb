require_relative '../config/environment'
# require_relative '..lib/api_communicator.rb'
# require_relative '..lib/command_line_interface.rb'


welcome
query = get_request_from_user
search_results = Article.search_for_article(query)
articles_array = Article.get_articles_array(search_results)
Article.print_articles(articles_array)

require_relative '../config/environment'
# require_relative '..lib/api_communicator.rb'
# require_relative '..lib/command_line_interface.rb'


welcome
query = get_request_from_user
search_results = Article.search_for_article(query)
articles_hash = get_individual_article(search_results)

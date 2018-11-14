require_relative '../config/environment'
# require_relative '..lib/api_communicator.rb'
# require_relative '..lib/command_line_interface.rb'


welcome
query = get_search_request_from_user
search_results = search_for_article(query)
articles_array = get_articles_array(search_results)
print_articles(articles_array)
answer = prompt_save_article
article_id = enter_article_id(answer)
create_article_instance(articles_array, article_id)

# welcome
# get_name_from_user

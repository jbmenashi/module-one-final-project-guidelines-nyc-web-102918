require_relative '../config/environment'
# require_relative '..lib/api_communicator.rb'
# require_relative '..lib/command_line_interface.rb'


welcome
name = get_name_from_user
options_menu(name)
# 1
name.unread_articles
answer = prompt_read_article
article_id = enter_article_id_to_mark_as_read(answer)
name.change_unread_to_read(article_id)
# 2
name.already_read_articles
# 3
query = get_search_request_from_user
search_results = search_for_article(query)
articles_array = get_articles_array(search_results)
print_articles(articles_array)
answer = prompt_save_article
article_id = enter_article_id(answer)
article = create_article_instance(articles_array, article_id)
create_reader_article_instance(name, article)

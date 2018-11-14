require_relative '../config/environment'
# require_relative '..lib/api_communicator.rb'
# require_relative '..lib/command_line_interface.rb'


welcome
name = get_name_from_user
options_menu(name)
# 1
# Unread Articles:  for each reader_article in name.reader_articles, if is_read = false, puts article title + URL + pub_date
# now_is_read method: if you put in an article ID, change the associated reader_article with that Reader to have is_read = true
# 2
# Read Articles: same as above, but with is_read = true
# 3
query = get_search_request_from_user
search_results = search_for_article(query)
articles_array = get_articles_array(search_results)
print_articles(articles_array)
answer = prompt_save_article
article_id = enter_article_id(answer)
article = create_article_instance(articles_array, article_id)
create_reader_article_instance(name, article)

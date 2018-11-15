def welcome
  puts "Welcome to the New York Times Archives!"
end

def get_name_from_user
  puts "Please enter your name:"
  username = gets.chomp
  Reader.find_or_create_by(name: username)
end

# def options_menu(username)
#   puts "Hello #{username.name}! What would you like to do?"
#   puts "1 View Unread Articles"
#   puts "2 View Read Articles"
#   puts "3 Search For Articles"
#   gets.chomp
# end

def prompt_read_article
  puts "Do you want to mark an article as 'Read'? YES/NO"
  gets.chomp
end

def enter_article_id_to_mark_as_read(answer)
  if answer == "YES"
    puts "Please enter Article ID"
    gets.chomp
  end
end

def get_search_request_from_user
  puts "Please enter a keyword or date (YYYYMMDD):"
  gets.chomp
end

def prompt_save_article
  puts "Is there an article you wish to save? Enter YES/NO"
  gets.chomp
end

def enter_article_id(answer)
  if answer == "YES"
    puts "Please enter Article ID"
    gets.chomp
  else
    puts "Another search?"
  end
end

def create_reader_article_instance(username, article)
  ReaderArticle.create(reader_id: username.id, article_id: article.id, is_read: false)
  puts "Article saved!"
end


def option_three_search(username)
  query = get_search_request_from_user
  search_results = search_for_article(query)
  articles_array = get_articles_array(search_results)
  print_articles(articles_array)
  answer = prompt_save_article
  article_id = enter_article_id(answer)
  article = create_article_instance(articles_array, article_id)
  create_reader_article_instance(username, article)
end

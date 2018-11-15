def welcome
  puts "Welcome to the New York Times Archives!"
end

def get_name_from_user
  puts "Please enter your name:"
  username = gets.chomp
  Reader.find_or_create_by(name: username)
end

def prompt_read_article
  puts "Do you want to read an article? YES/NO"
  gets.chomp
end

def enter_article_id_to_mark_as_read(answer)
  if answer == "YES" || answer == "yes"
    puts "Please enter Article ID to open in browser:"
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
  if answer == "YES" || answer == "yes"
    puts "Please enter Article ID"
    gets.chomp
  end
end

def create_reader_article_instance(username, article)
  ReaderArticle.find_or_create_by(reader_id: username.id, article_id: article.id, is_read: false)
  puts "Article saved!"
end


def option_three_search(username)
  sleep(1)
  query = get_search_request_from_user
  sleep(1)
  search_results = search_for_article(query)
  articles_array = get_articles_array(search_results)
  print_articles(articles_array)
  answer = prompt_save_article
  article_id = enter_article_id(answer)
  if article_id
    article = create_article_instance(articles_array, article_id)
    create_reader_article_instance(username, article)
  end
end

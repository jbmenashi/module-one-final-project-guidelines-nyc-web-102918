def welcome
  puts "Welcome to the New York Times Archives!"
end

def get_name_from_user
  puts "Please enter your name:"
  name = gets.chomp
  Reader.find_or_create_by(name: name)
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
  end
end

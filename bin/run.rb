require_relative '../config/environment'
# require_relative '..lib/api_communicator.rb'
# require_relative '..lib/command_line_interface.rb'
require 'highline'


# welcome
# username = get_name_from_user
# # options_menu(username)
# # 1
# username.option_one_unread
# # 2
# username.option_two_read
# # 3
# option_three_search(username)
cli = HighLine.new

begin
  welcome
  username = get_name_from_user
  loop do
    cli.choose do |menu|
      menu.prompt = "Hello #{username}! What would you like to do?"
      menu.choice(:ViewUnreadArticles) { username.option_one_unread() }
      menu.choice(:ViewReadArticles) { username.option_two_read() }
      menu.choice(:SearchArticles) { option_three_search(username)}
      menu.choice(:Quit, "Exit program.") { exit }
    end
  end
end

require_relative '../config/environment'

require 'highline'


cli = HighLine.new


welcome
username = get_name_from_user
loop do
  cli.choose do |menu|
    sleep(1)
    menu.prompt = "Hello #{username.name}! What would you like to do?"
    menu.choice(:View_Unread_Articles) { username.option_one_unread() }
    menu.choice(:View_Read_Articles) { username.option_two_read() }
    menu.choice(:Search_For_Articles) { option_three_search(username)}
    menu.choice(:Quit, "Exit program.") { exit }
  end
end

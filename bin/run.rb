require_relative '../config/environment'

require 'highline'
require 'launchy'


cli = HighLine.new

puts "


MMMMMMMM               MMMMMMMYYYYYYY       YYYYYYTTTTTTTTTTTTTTTTTTTTTTT iiii
M:::::::M             M:::::::Y:::::Y       Y:::::T:::::::::::::::::::::Ti::::i
M::::::::M           M::::::::Y:::::Y       Y:::::T:::::::::::::::::::::T iiii
M:::::::::M         M:::::::::Y::::::Y     Y::::::T:::::TT:::::::TT:::::T
M::::::::::M       M::::::::::YYY:::::Y   Y:::::YYTTTTTT  T:::::T  TTTTTiiiiiii   mmmmmmm    mmmmmmm      eeeeeeeeeeee       ssssssssss
M:::::::::::M     M:::::::::::M  Y:::::Y Y:::::Y          T:::::T       i:::::i mm:::::::m  m:::::::mm  ee::::::::::::ee   ss::::::::::s
M:::::::M::::M   M::::M:::::::M   Y:::::Y:::::Y           T:::::T        i::::im::::::::::mm::::::::::me::::::eeeee:::::ess:::::::::::::s
M::::::M M::::M M::::M M::::::M    Y:::::::::Y            T:::::T        i::::im::::::::::::::::::::::e::::::e     e:::::s::::::ssss:::::s
M::::::M  M::::M::::M  M::::::M     Y:::::::Y             T:::::T        i::::im:::::mmm::::::mmm:::::e:::::::eeeee::::::es:::::s  ssssss
M::::::M   M:::::::M   M::::::M      Y:::::Y              T:::::T        i::::im::::m   m::::m   m::::e:::::::::::::::::e   s::::::s
M::::::M    M:::::M    M::::::M      Y:::::Y              T:::::T        i::::im::::m   m::::m   m::::e::::::eeeeeeeeeee       s::::::s
M::::::M     MMMMM     M::::::M      Y:::::Y              T:::::T        i::::im::::m   m::::m   m::::e:::::::e          ssssss   s:::::s
M::::::M               M::::::M      Y:::::Y            TT:::::::TT     i::::::m::::m   m::::m   m::::e::::::::e         s:::::ssss::::::s
M::::::M               M::::::M   YYYY:::::YYYY         T:::::::::T     i::::::m::::m   m::::m   m::::me::::::::eeeeeeee s::::::::::::::s
M::::::M               M::::::M   Y:::::::::::Y         T:::::::::T     i::::::m::::m   m::::m   m::::m ee:::::::::::::e  s:::::::::::ss
MMMMMMMM               MMMMMMMM   YYYYYYYYYYYYY         TTTTTTTTTTT     iiiiiiimmmmmm   mmmmmm   mmmmmm   eeeeeeeeeeeeee   sssssssssss


"
welcome
username = get_name_from_user
loop do
  cli.choose do |menu|
    sleep(1)
    system "clear"
    menu.prompt = "Hello #{username.name}! What would you like to do?"
    menu.choice(:View_Unread_Articles) { username.option_one_unread() }
    menu.choice(:View_Read_Articles) { username.option_two_read() }
    menu.choice(:Search_For_Articles) { option_three_search(username)}
    menu.choice(:Statistics) { username.option_four_stats() }
    menu.choice(:Quit, "Exit program.") { exit }
  end
end

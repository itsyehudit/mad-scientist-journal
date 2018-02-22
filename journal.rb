entries = ["This entry is empty, choose other one"]

def mainMenu
  puts "= Welcome to your Journal! =

  1 Add entry
  2 View entries -UNAVAILABLE-
  3 Quit

  Choose an option\n\n"

  menu = gets.to_i

  case menu
  when 1
    entry = gets.to_s
    entries.push(entry)
  when 2
    entriesMenu
  when 3
    puts "Bye!"
  else
    puts "Something went wrong, try again."
  end
end

mainMenu

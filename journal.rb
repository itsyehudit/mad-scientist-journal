entries = ["This entry is empty, choose other one"]
availableEntries = entries.length - 1

def mainMenu
  puts "= Welcome to your Journal! =

  1 Add entry
  2 View entries
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

def entriesMenu
  puts " = Choose an option =

  a Read entry
  b Edit entry -UNAVAILABLE-
  c Delete entry -UNAVAILABLE-
  d <<< Return to Main Menu\n\n"

  menu2 = gets.chomp
  case menu2
  when "a"
    puts "Choose one of #{availableEntries}"
    read = gets.to_i
    puts entries[read]
  when "b"

  when "c"

  when "d"
    mainMenu
  else
    puts "Something went wrong, try again."
  end
end

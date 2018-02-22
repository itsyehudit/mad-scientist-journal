$entries = ["This entry is empty, choose other one"]
$entry = nil

def entriesMenu
  puts " = Choose an option =

  a Read entry
  b Edit entry
  c Delete entry
  d <<< Return to Main Menu\n\n"

  menu2 = gets.chomp
  case menu2
  when "a"
    puts "Choose one of #{$entries.length-1}"
    read = gets.to_i
    puts $entries[read]
    puts "Continue reading? Y/N"
    continue = gets.chomp
    if continue === "y" || continue === "Y" || continue === "YES" || continue === "yes"
      puts "Choose one of #{$entries.length-1}"
      read = gets.to_i
      puts $entries[read]
    else
      entriesMenu
    end
  when "b"
    puts "Choose one of #{$entries.length-1}"
    read = gets.to_i
    $entries.delete_at(read)
    puts "Please edit your entry:"
    $entry = gets.to_s
    $entries.insert(read, $entry)
    entriesMenu
  when "c"
    puts "Choose one of #{$entries.length-1}"
    read = gets.to_i
    $entries.delete_at(read)
    entriesMenu
  when "d"
    mainMenu
  else
    puts "Something went wrong, try again."
  end
end

def mainMenu
  puts "= Welcome to your Journal! =

  1 Add entry
  2 View entries
  3 Quit

  Choose an option\n\n"

  menu = gets.to_i

  case menu
  when 1
    $entry = gets.to_s
    $entries.push($entry)
    mainMenu
  when 2
    entriesMenu
  when 3
    puts "Bye!"
  else
    puts "Something went wrong, try again."
    mainMenu
  end
end

mainMenu

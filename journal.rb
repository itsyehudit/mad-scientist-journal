$entries = ["This entry is empty, choose other one"]
$entry = nil
$name = nil
puts "What is your name?"
$name = gets.chomp

def entriesMenu
  puts "

   = Choose an option =

  a Read entry
  b Edit entry
  c Delete entry
  d <<< Return to Main Menu\n\n"

  menu2 = gets.chomp
  case menu2
  when "a"
    puts "Choose one of #{$entries.length-1}."
    read = gets.to_i
    puts "Your #{read} entry:"
    puts $entries[read]
    puts "Continue reading? Y/N"
    continue = gets.chomp
    if continue === "y" || continue === "Y" || continue === "YES" || continue === "yes"
      puts "Choose one of #{$entries.length-1}."
      read = gets.to_i
      puts $entries[read]
    else
      entriesMenu
    end
  when "b"
    puts "Choose one of #{$entries.length-1}."
    read = gets.to_i
    $entries.delete_at(read)
    puts "Please edit your #{read} entry:"
    $entry = gets.to_s
    $entries.insert(read, $entry)
    puts "Your #{read} entry was successfuly edited."
    entriesMenu
  when "c"
    puts "Choose one of #{$entries.length-1}."
    read = gets.to_i
    $entries.delete_at(read)
    puts "Your #{read} entry was successfuly deleted."
    entriesMenu
  when "d"
    mainMenu
  else
    puts "Something went wrong, try again."
  end
end

def mainMenu
  puts "

  = Welcome to your Journal, #{$name}! =

  = Choose an option =

  1 Add entry
  2 View entries
  3 Quit\n\n"

  menu = gets.to_i

  case menu
  when 1
    puts "Please add your entry below:"
    $entry = gets.to_s
    $entries.push($entry)
    puts "Your entry was successfuly added."
    mainMenu
  when 2
    entriesMenu
  when 3
    puts "Bye, #{$name}!"
  else
    puts "Something went wrong, try again."
    mainMenu
  end
end

mainMenu

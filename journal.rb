puts "= Welcome to your Journal! =

1. Add entry -UNAVAILABLE-
2. Edit entry -UNAVAILABLE-
3. Read entry
4. Quit


Choose an option\n\n"

menu = gets.to_i

case menu
when 3
  puts "Entry 00.00.00"
  puts "Lorem ipsum dolor sit amet,"
  puts "gloriatur comprehensam qui ad,"
  puts "maiorum convenire disputationi in qui,"
  puts "id ius dico integre."
when 4
  puts "Bye!"
else
  puts "Something went wrong, try again."
end

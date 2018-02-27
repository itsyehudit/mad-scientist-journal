class Journal
  def initialize
    @entries = ["This entry is empty, choose other one"]
    @entry = nil
  end

  def add_entry
    puts "Please add your entry below:"
    @entry = gets.to_s
    @entries.push(@entry)
    puts "Your entry was successfuly added."
    main_menu
  end

  def read_entry
    puts "Choose one of #{@entries.length-1}."
    read = gets.to_i
    puts "Your #{read} entry:"
    puts @entries[read]
    puts "Continue reading? Y/N"
    continue = gets.chomp
    while continue === "y" || continue === "Y" || continue === "YES" || continue === "yes"
      puts "Choose one of #{@entries.length-1}."
      read = gets.to_i
      puts @entries[read]
      puts "Continue reading? Y/N"
      continue = gets.chomp
    end
    view_entries_menu
  end

  def edit_entry
    puts "Choose one of #{@entries.length-1}."
    read = gets.to_i
    @entries.delete_at(read)
    puts "Please edit your #{read} entry:"
    @entry = gets.to_s
    @entries.insert(read, @entry)
    puts "Your #{read} entry was successfuly edited."
    view_entries_menu
  end

  def delete_entry
    puts "Choose one of #{@entries.length-1}."
    read = gets.to_i
    @entries.delete_at(read)
    puts "Your #{read} entry was successfuly deleted."
    view_entries_menu
  end

  def view_entries_menu
    puts "

     = Choose an option =

    a Read entry
    b Edit entry
    c Delete entry
    d <<< Return to Main Menu\n\n"

    entries_menu = gets.chomp

    case entries_menu
    when "a"
      read_entry
    when "b"
      edit_entry
    when "c"
      delete_entry
    when "d"
      main_menu
    else
      puts "Something went wrong, try again."
      view_entries_menu
    end
  end

  def main_menu
    puts "

    = Welcome to your Journal! =

    = Choose an option =

    1 Add entry
    2 View entries
    3 Quit\n\n"

    menu = gets.to_i

    case menu
    when 1
      add_entry
    when 2
      view_entries_menu
    when 3
      puts "Bye!"
    else
      puts "Something went wrong, try again."
      main_menu
    end
  end

end

my_journal = Journal.new
my_journal.main_menu

require_relative "journal"

class Menu
  def initialize
    @journal = Journal.new
  end

  def choose_n_display_entry
    puts "Choose one of #{@journal.available_entries_count}."
    entry_number = gets.to_i
    puts "Your #{entry_number} entry:"
    puts "#{@journal.entry(entry_number-1)}"
  end

  def add_entry
    puts "Please add your entry below:"
    new_entry = gets.chomp
    @journal.add_entry(new_entry)
    puts "Your entry was successfuly added."
    main_menu
  end

  def read_entry
    choose_n_display_entry
    puts "Continue reading? Y/N"
    continue = gets.chomp
    continue = continue.downcase
    while continue === "y" || continue === "yes"
      choose_n_display_entry
      puts "Continue reading? Y/N"
      continue = gets.chomp
      continue = continue.downcase
    end
    view_entries_menu
  end

  def edit_entry
    puts "Choose one of #{@journal.available_entries_count}."
    entry_number = gets.to_i
    puts "Please edit your #{entry_number} entry:"
    replacement_entry = gets.chomp
    @journal.edit_entry(entry_number-1, replacement_entry)
    puts "Your #{entry_number} entry was successfuly edited."
    view_entries_menu
  end

  def delete_entry
    puts "Choose one of #{@journal.available_entries_count}."
    entry_number = gets.to_i
    @journal.delete_entry(entry_number-1)
    puts "Your #{entry_number} entry was successfuly deleted."
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

new_journal = Menu.new
new_journal.main_menu

module CLI
  class Menu
    def initialize(journal)
      @journal = journal
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
        quit
      else
        puts "Something went wrong, try again."
        main_menu
      end
    end

    private
      def choose_and_display_entry
        entry_list
        entry_number = gets.to_i
        puts "Date: #{@journal.date(entry_number-1)}"
        puts "\"#{@journal.title(entry_number-1)}\""
        puts "#{@journal.content(entry_number-1)}"
      end

      def entry_list
        puts "Choose one of your entries:"
        i = 1
        while i <= @journal.available_entries_count
          puts "#{i}. #{@journal.title(i-1)}"
          i +=1
        end
      end

      def add_entry
        puts "Please add your entry below:"
        new_content = gets.chomp
        puts "Please add your title below:"
        new_title = gets.chomp
        new_date = Time.now
        @journal.add_entry(new_content, new_title, new_date)
        puts "Your entry was successfuly added."
        main_menu
      end

      def read_entry
        choose_and_display_entry
        puts "Continue reading? Y/N"
        continue = gets.chomp
        continue = continue.downcase
        while continue == "y" || continue == "yes"
          choose_and_display_entry
          puts "Continue reading? Y/N"
          continue = gets.chomp
          continue = continue.downcase
        end
        view_entries_menu
      end

      def edit_entry
        entry_list
        entry_number = gets.to_i
        puts "Please edit your #{entry_number} entry:"
        replacement_content = gets.chomp
        puts "Please edit your #{entry_number} title:"
        replacement_title = gets.chomp
        replacement_date = Time.now
        @journal.edit_entry(entry_number-1, replacement_content, replacement_title, replacement_date)
        puts "Your #{entry_number} entry was successfuly edited."
        view_entries_menu
      end

      def delete_entry
        entry_list
        entry_number = gets.to_i
        @journal.delete_entry(entry_number-1)
        puts "Your #{entry_number} entry was successfuly deleted."
        view_entries_menu
      end

    def quit
      puts "Bye!"
      @journal.quit
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

  end
end

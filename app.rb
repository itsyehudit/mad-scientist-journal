require "optparse"
require_relative "menu"
require_relative "journal_file"
require_relative "journal_memory"

options = {}

parser = OptionParser.new do |opts|
  opts.banner = "Using: app.rb [options]"
  opts.on("-s", "--save memory", "Entry saving options: \"memory\" (default) or \"file\"") do |save|
    if save == "memory" || save == "file"
      options[:save] = save;
    else
      puts opts
      exit
    end
  end

  opts.on("-h", "--help", "Display help") do
    puts opts
    exit
  end
end

parser.parse!

options[:save] ||= "memory"

if options[:save] == "memory"
  journal = JournalMemory.new
elsif options[:save] == "file"
  journal = JournalFile.new
end

menu = Menu.new(journal)
menu.main_menu

require "optparse"
require_relative "cli/menu"
require_relative "../lib/file_journal"
require_relative "../lib/memory_journal"

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
  journal = MemoryJournal.new
elsif options[:save] == "file"
  journal = FileJournal.new
end

menu = CLI::Menu.new(journal)
menu.main_menu

require "yaml"
require_relative "editable"

class FileJournal
  include Editable

  def initialize
    @entries = []
    @titles = []
    @dates = []
    if File.exists?("journal_data.yaml")
      @entries = YAML.load_file("journal_data.yaml")
      @titles = YAML.load_file("journal_titles.yaml")
      @dates = YAML.load_file("journal_dates.yaml")
    else
      File.new("journal_data.yaml", "w") do |j|
        j.write(@entries.to_yaml)
      end
      File.new("journal_titles.yaml", "w") do |t|
        t.write(@titles.to_yaml)
      end
      File.new("journal_dates.yaml", "w") do |d|
        d.write(@dates.to_yaml)
      end
    end
  end

  def quit
    File.open("journal_data.yaml", "w") do |j|
      j.write(@entries.to_yaml)
      j.close
    end
    File.open("journal_titles.yaml", "w") do |t|
      t.write(@titles.to_yaml)
      t.close
    end
    File.open("journal_dates.yaml", "w") do |d|
      d.write(@dates.to_yaml)
      d.close
    end
  end
end

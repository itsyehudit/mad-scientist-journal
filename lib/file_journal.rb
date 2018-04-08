require "yaml"
require_relative "editable"

class FileJournal
  attr_accessor :entries

  include Editable

  def initialize (filename = 'journal_data')
    @entries = []
    @filename = filename

    if File.exists?("#{@filename}.yaml")
      @entries = YAML.load_file("#{@filename}.yaml") || []
    else
      File.new("#{@filename}.yaml", "w")
    end
  end

  def quit
    File.open("#{@filename}.yaml", "w") do |j|
      j.write(@entries.to_yaml)
      j.close
    end
  end
end

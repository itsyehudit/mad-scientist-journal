require "yaml"
require_relative "modules"

class JournalFile
  def initialize
    @entries = []
    if File.exists?("journal_data.yaml")
      @entries = YAML.load_file("journal_data.yaml")
    else
      File.new("journal_data.yaml", "w") do |j|
        j.write(@entries.to_yaml)
      end
    end
  end

  include Editable

  def quit
    File.open("journal_data.yaml", "w") do |j|
      j.write(@entries.to_yaml)
      j.close
    end
  end
end

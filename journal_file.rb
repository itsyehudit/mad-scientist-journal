require "yaml"

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

  def add_entry(new_entry)
    @entries.push(new_entry)
  end

  def available_entries_count
    @entries.length
  end

  def entry(entry_number)
    @entries[entry_number]
  end

  def edit_entry(entry_number, replacement_entry)
    @entries.delete_at(entry_number)
    @entries.insert(entry_number, replacement_entry)
  end

  def delete_entry(entry_number)
    @entries.delete_at(entry_number)
  end

  def quit
    File.open("journal_data.yaml", "w") do |j|
      j.write(@entries.to_yaml)
      j.close
    end
  end
end

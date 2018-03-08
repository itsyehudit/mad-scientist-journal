require 'yaml'

class Journal
  def initialize
    @entries = []
  end

  def add_entry(new_entry)
    if File.exists?('journal_data.yaml')
      @entries = YAML.load_file('journal_data.yaml')
    end
    @entries.push(new_entry)
    File.open('journal_data.yaml', 'w') do |j|
      j.write(@entries.to_yaml)
      j.close
    end
  end

  def available_entries_count
    if File.exists?('journal_data.yaml')
      @entries = YAML.load_file('journal_data.yaml')
    end
    @entries.length
  end

  def entry(entry_number)
    if File.exists?('journal_data.yaml')
      @entries = YAML.load_file('journal_data.yaml')
    end
    @entries[entry_number]
  end

  def edit_entry(entry_number, replacement_entry)
    if File.exists?('journal_data.yaml')
      @entries = YAML.load_file('journal_data.yaml')
    end
    @entries.delete_at(entry_number)
    @entries.insert(entry_number, replacement_entry)
    File.open('journal_data.yaml', 'w') do |j|
      j.write(@entries.to_yaml)
      j.close
    end
  end

  def delete_entry(entry_number)
    if File.exists?('journal_data.yaml')
      @entries = YAML.load_file('journal_data.yaml')
    end
    @entries.delete_at(entry_number)
    File.open('journal_data.yaml', 'w') do |j|
      j.write(@entries.to_yaml)
      j.close
    end
  end
end

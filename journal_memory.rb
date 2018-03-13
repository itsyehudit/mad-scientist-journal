class JournalMemory
  def initialize
    @entries = []
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
  end
end

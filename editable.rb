require_relative "journal_entry"

module Editable
  def add_entry(new_content, new_title, new_date)
    entry = JournalEntry.new(new_content, new_title, new_date)
    @entries.push(entry)
  end

  def available_entries_count
    @entries.length
  end

  def entry(entry_number)
    @entries[entry_number].content
  end

  def title(entry_number)
    @entries[entry_number].title
  end

  def date(entry_number)
    @entries[entry_number].date
  end

  def edit_entry(entry_number, replacement_content, replacement_title, replacement_date)
    @entries[entry_number].content = replacement_content
    @entries[entry_number].title = replacement_title
    @entries[entry_number].date = replacement_date
  end

  def delete_entry(entry_number)
    @entries.delete_at(entry_number)
  end
end

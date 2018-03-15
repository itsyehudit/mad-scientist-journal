module Editable
  def add_entry(new_entry, new_title, new_date)
    @entries.push(new_entry)
    @titles.push(new_title)
    @dates.push(new_date)
  end

  def available_entries_count
    @entries.length
  end

  def entry(entry_number)
    @entries[entry_number]
  end

  def title(entry_number)
    @titles[entry_number]
  end

  def date(entry_number)
    @dates[entry_number]
  end

  def edit_entry(entry_number, replacement_entry, replacement_title, replacement_date)
    @entries.delete_at(entry_number)
    @titles.delete_at(entry_number)
    @dates.delete_at(entry_number)
    @entries.insert(entry_number, replacement_entry)
    @titles.insert(entry_number, replacement_title)
    @dates.insert(entry_number, replacement_date)
  end

  def delete_entry(entry_number)
    @entries.delete_at(entry_number)
    @titles.delete_at(entry_number)
    @dates.delete_at(entry_number)
  end
end

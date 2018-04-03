require_relative '../lib/file_journal'

describe FileJournal do

  describe '#add_entry' do
    it 'adds the entry to the entries pool' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      x = journal.available_entries_count

      first_entry = journal.entries[x-1]
      expect(first_entry.title).to eq('monday')
      expect(first_entry.content).to eq('contentcontentcontent')
      expect(first_entry.date).to eq('2018-03-14 03-14-00')

      File.delete('journal_data.yaml')
    end
  end

  describe '#available_entries_count' do
    it 'returns number of available entries' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      x = journal.available_entries_count

      journal.add_entry(content, title, date)
      journal.add_entry(content, title, date)
      journal.add_entry(content, title, date)

      expect(journal.available_entries_count).to eq(x+3)

      File.delete('journal_data.yaml')
    end
  end

  describe '#content' do
    it 'displays content of the chosen entry' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      x = journal.available_entries_count

      expect(journal.content(x-1)).to eq('contentcontentcontent')

      File.delete('journal_data.yaml')
    end
  end

  describe '#title' do
    it 'displays title of the chosen entry' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      x = journal.available_entries_count

      expect(journal.title(x-1)).to eq('monday')

      File.delete('journal_data.yaml')
    end
  end

  describe '#date' do
    it 'displays date of the chosen entry' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      x = journal.available_entries_count

      expect(journal.date(x-1)).to eq('2018-03-14 03-14-00')

      File.delete('journal_data.yaml')
    end
  end

  describe '#edit_entry' do
    it 'replaces a chosen entry with a new one' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      new_title = 'Tuesday'
      new_content = 'Today was a wonderful day'
      new_date = '2018-03-15 04-01-00'

      x = journal.available_entries_count

      journal.edit_entry(x-1, new_content, new_title, new_date)

      replacement_entry = journal.entries[x-1]
      expect(replacement_entry.title).to eq('Tuesday')
      expect(replacement_entry.content).to eq('Today was a wonderful day')
      expect(replacement_entry.date).to eq('2018-03-15 04-01-00')

      File.delete('journal_data.yaml')
    end
  end

  describe '#delete_entry' do
    it 'removes entry from the entries pool' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      new_title = 'Tuesday'
      new_content = 'Today was a wonderful day'
      new_date = '2018-03-15 04-01-00'

      journal.add_entry(new_content, new_title, new_date)

      x = journal.available_entries_count

      journal.delete_entry(0)

      expect(journal.entries).not_to include journal.entries[x-1]

      File.delete('journal_data.yaml')
    end
  end

  describe '#quit' do
    it 'closes the application and saves entries to the file' do
      journal = FileJournal.new
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      x = journal.available_entries_count

      journal.quit

      if File.exists?("journal_data.yaml")
        test_container = YAML.load_file("journal_data.yaml")
      end

      expect(test_container.length).to eq(x)

      File.delete('journal_data.yaml')
    end
  end
end

require_relative '../lib/file_journal'

describe FileJournal do

  before(:each) do
    File.new('test_journal_data.yaml', 'w')
  end

  after(:each) do
    File.delete('test_journal_data.yaml')
  end

  describe '#add_entry' do
    it 'adds the entry to the entries pool' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      first_entry = journal.entries[0]
      expect(first_entry.title).to eq('monday')
      expect(first_entry.content).to eq('contentcontentcontent')
      expect(first_entry.date).to eq('2018-03-14 03-14-00')
    end
  end

  describe '#available_entries_count' do
    it 'returns number of available entries' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)
      journal.add_entry(content, title, date)
      journal.add_entry(content, title, date)

      expect(journal.available_entries_count).to eq(3)
    end
  end

  describe '#content' do
    it 'displays content of the chosen entry' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      expect(journal.content(0)).to eq('contentcontentcontent')
    end
  end

  describe '#title' do
    it 'displays title of the chosen entry' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      expect(journal.title(0)).to eq('monday')
    end
  end

  describe '#date' do
    it 'displays date of the chosen entry' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      expect(journal.date(0)).to eq('2018-03-14 03-14-00')
    end
  end

  describe '#edit_entry' do
    it 'replaces a chosen entry with a new one' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      new_title = 'Tuesday'
      new_content = 'Today was a wonderful day'
      new_date = '2018-03-15 04-01-00'

      journal.edit_entry(0, new_content, new_title, new_date)

      replacement_entry = journal.entries[0]
      expect(replacement_entry.title).to eq('Tuesday')
      expect(replacement_entry.content).to eq('Today was a wonderful day')
      expect(replacement_entry.date).to eq('2018-03-15 04-01-00')
    end
  end

  describe '#delete_entry' do
    it 'removes entry from the entries pool' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)

      new_title = 'Tuesday'
      new_content = 'Today was a wonderful day'
      new_date = '2018-03-15 04-01-00'

      journal.add_entry(new_content, new_title, new_date)
      journal.delete_entry(0)

      first_entry = journal.entries[0]
      expect(first_entry.title).to eq('Tuesday')
      expect(first_entry.content).to eq('Today was a wonderful day')
      expect(first_entry.date).to eq('2018-03-15 04-01-00')
      expect(journal.available_entries_count).to eq(1)
    end
  end

  describe '#quit' do
    it 'closes the application and saves entries to the file' do
      journal = FileJournal.new('test_journal_data')
      title = 'monday'
      content = 'contentcontentcontent'
      date = '2018-03-14 03-14-00'

      journal.add_entry(content, title, date)
      journal.quit

      test_container = YAML.load_file("test_journal_data.yaml")
      expect(test_container.length).to eq(journal.available_entries_count)
    end
  end
end

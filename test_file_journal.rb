require 'rspec'
require_relative 'file_journal'

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
    end
  end
end

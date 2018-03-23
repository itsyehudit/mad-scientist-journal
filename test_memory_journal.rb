require 'rspec'
require_relative 'memory_journal'

describe MemoryJournal do
  let(:journal) {MemoryJournal.new}
  let(:entries) {journal.entries}

  describe 'adding entry' do
    it 'adds the entry to the entries pool' do
      journal.add_entry('contentcontentcontent', 'monday', 'date-00-00-00')
      expect(entries[0].content).to include 'contentcontentcontent'
      expect(entries[0].title).to include 'monday'
      expect(entries[0].date).to include 'date-00-00-00'
    end
  end

end

class JournalEntry
  attr_accessor :title, :content, :date

  def initialize(content, title, date)
    @content = content
    @title = title
    @date = date
  end
end

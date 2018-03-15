require_relative "editable"

class MemoryJournal
  include Editable

  def initialize
    @entries = []
    @titles = []
    @dates = []
  end

  def quit
  end
end

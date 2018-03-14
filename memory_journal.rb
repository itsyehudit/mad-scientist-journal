require_relative "editable"

class MemoryJournal
  include Editable

  def initialize
    @entries = []
  end

  def quit
  end
end

require_relative "editable"

class MemoryJournal
  attr_accessor :entries

  include Editable

  def initialize
    @entries = []
  end

  def quit
  end
end

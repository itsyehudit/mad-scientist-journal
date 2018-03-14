require_relative "editable"

class JournalMemory
  include Editable

  def initialize
    @entries = []
  end

  def quit
  end
end

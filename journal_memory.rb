require_relative "modules"

class JournalMemory
  def initialize
    @entries = []
  end

  include Editable

  def quit
  end
end

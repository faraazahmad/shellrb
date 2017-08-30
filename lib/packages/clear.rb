require_relative 'core'
require 'os'

class Clear
  def self.main params
    OS.windows? ? system("cls") : system("clear")
  end
end

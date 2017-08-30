# frozen_string_literal: true
require_relative 'core'
require 'os'

# This class is used to clear the terminal
class Clear
  def self.main
    OS.windows? ? system('cls') : system('clear')
  end
end

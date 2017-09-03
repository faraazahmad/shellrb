# frozen_string_literal: true

require_relative 'core'
require 'os'

# This class is used to clear the terminal
class Clear
  def self.main params
    # If the OS is Windows, execute command 'cls', else execute 'clear'
    OS.windows? ? system('cls') : system('clear')
  end
end

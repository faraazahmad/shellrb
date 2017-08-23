require 'set'
require_relative 'core'

class Ls
  def self.main params
    # Create new instance of Ruby data structure Set to add output to it
    # For more info on set: http://ruby-doc.org/stdlib-2.4.1/libdoc/set/rdoc/Set.html
    result = Set.new

    # If no parameter has been provided, show only non-hidden files
    if params.length == 0
      result = show_non_hidden
    else
      # checks only for one (first) paramter
      # TODO: change code for multiple parameters
      case params[0]
      when '-a', '--all'
        # When user requests all files and folders, merge hidden and non-hidden sets
        result = show_non_hidden.merge show_hidden
      else
        # if argument given as parameter is unknown, show error
        result.add "#{self.name.downcase}: Unknown argument \'#{params[0]}\'"
      end
    end

    Core.print_result result
  end

  def self.show_hidden
    # See line 7
    hidden_files = Set.new

    # Hidden files and folders' name start with a '.'
    # Use this property to identify hidden files and folders
    Dir.entries(Dir.pwd).each do |entry|
      hidden_files.add entry if entry[0] == '.'
    end
    hidden_files
  end

  def self.show_non_hidden
    # See line 7
    non_hidden = Set.new

    Dir.entries(Dir.pwd).each do |entry|
      non_hidden.add entry unless entry[0] == '.'
    end
    non_hidden
  end
end

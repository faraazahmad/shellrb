require "set"
require_relative "display"
require_relative "core"

class Ls

  def self.main params
    result = Set.new

    if params.length == 0
      result = show_non_hidden
      Core.print_result result
    else
      case params[0]
      when "-a"
        result = show_non_hidden.merge show_hidden
        Core.print_result result
      else
        error = "#{self.name.downcase}: Unknown argument \'#{params[0]}\'"
        Display.print_error error
      end
    end

    
  end

  def self.show_hidden
    hidden_files = Set.new

    Dir.entries(Dir.pwd).each do |entry|
      hidden_files.add entry if entry[0] == "."
    end
    hidden_files
  end

  def self.show_non_hidden
    non_hidden = Set.new

    Dir.entries(Dir.pwd).each do |entry|
      non_hidden.add entry unless entry[0] == "."
    end
    non_hidden
  end

end

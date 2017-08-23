require 'psych'
require 'set'

# System (Sys) class to display information about ShellRB
class Sys
  def self.main params
    # Create new instance of Ruby data structure Set to add output to it
    # For more info on set: http://ruby-doc.org/stdlib-2.4.1/libdoc/set/rdoc/Set.html
    result = Set.new

    # checks only for one (first) paramter
    # TODO: change code for multiple parameters
    case params[0]
    when '-i', '--info'
      result = info
    end
    Core.print_result result
  end

  def self.info
    # See line 7
    info_set = Set.new

    # Psych.load returns a hash
    info_hash = Psych.load_file("#{File.dirname(__FILE__)}/../config.yml")

    info_hash.each do |property, value|
      description = "#{property}: #{value}"
      info_set.add description
    end
    info_set
  end
end

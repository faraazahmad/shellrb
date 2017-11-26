require_relative 'core'
require 'set'

class Help
  # outputs available methods for the user
  def self.main params
    result = Set.new
    # Create new instance of Ruby data structure Set to add output to it
    # For more info on set: http://ruby-doc.org/stdlib-2.4.1/libdoc/set/rdoc/Set.html
    
    # TODO: Handle case when params are sent as input

    # Assuming no params have been sent

    result.merge self.no_params

    puts 'These commands are defined in lib/packages. Type \'help\' to see this list '
    # Use the Core class of ShellRB to print result
    Core.print_result result
  end

  def self.no_params
    simple_result = Set.new
    entries = Dir.entries('lib/packages')
    
    entries.each do |entry|
      simple_result.add(entry[0..-4]) if entry[-3..-1] == '.rb'
    end

    simple_result
  end
end

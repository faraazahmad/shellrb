require 'set'
require_relative 'core'

class Pwd
  # Simply outputs the present working directory of the user
  def self.main params
    # Create new instance of Ruby data structure Set to add output to it
    # For more info on set: http://ruby-doc.org/stdlib-2.4.1/libdoc/set/rdoc/Set.html
    result = Set.new

    # TODO: Handle case when params are sent as input

    # Assuming no params have been sent
    result.merge self.no_params

    # Use the Core class of ShellRB to print result
    Core.print_result result
  end

  def self.no_params
    # Return a Set with content as Dir.pwd
    simple_result = Set.new
    simple_result.add Dir.pwd
  end
end

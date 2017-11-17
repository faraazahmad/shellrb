require_relative 'core'
require 'set'

class Help
  #outputs available methods for the user
  def self.main params
    result = Set.new
    # Create new instance of Ruby data structure Set to add output to it
    # For more info on set: http://ruby-doc.org/stdlib-2.4.1/libdoc/set/rdoc/Set.html
    entries = Dir.entries('lib/packages')
    # formatted_entries = entries.map(&:strip_rb)
    entries.each do |entry|
      entry.include?('.rb') ? result.add(entry[0..-4]) : result.add(entry)
    end
    Core.print_result result
  end

end

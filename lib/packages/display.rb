require 'colorized_string'

class Display

  def self.display_prompt
    print ColorizedString["SRB "].colorize(:yellow)
    print ColorizedString["#{Dir.pwd}"].colorize(:blue)
    print "> "
  end
  
  def self.print_error error
    puts ColorizedString["#{error}"].colorize(:red)
  end
  
end

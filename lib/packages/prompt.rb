require 'colorized_string'
require 'os'

def display_prompt
  print ColorizedString[(OS.windows? ? ENV["USERNAME"] : ENV["USER"]) + "@"].colorize(:yellow)
  print ColorizedString["SRB "].colorize(:yellow)
  print ColorizedString["#{Dir.pwd}"].colorize(:blue)
  print "> "
end

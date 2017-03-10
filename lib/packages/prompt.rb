require 'colorized_string'

def display_prompt
  print ColorizedString["SRB "].colorize(:yellow)
  print ColorizedString["#{Dir.pwd}"].colorize(:blue)
  print "> "
end

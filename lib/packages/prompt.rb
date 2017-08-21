require 'colorized_string'
require 'os'

def display_prompt
  print ColorizedString[display_user].colorize(:yellow)
  print ColorizedString["SRB "].colorize(:yellow)
  print ColorizedString["#{Dir.pwd}"].colorize(:blue)
  print "> "
end

def display_user
  (OS.windows? ? ENV['USERNAME'] : ENV['USER']) + '@'
end

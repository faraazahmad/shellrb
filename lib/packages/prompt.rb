require 'colorized_string'
require 'os'

def display_prompt
  print ColorizedString[get_user].colorize(:yellow)
  print ColorizedString["SRB "].colorize(:yellow)
  print ColorizedString["#{Dir.pwd}"].colorize(:blue)
  print "> "
end

def get_user
  (OS.windows? ? ENV["USERNAME"] : ENV["USER"]) + "@"
end
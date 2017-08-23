require 'colorized_string'
require 'os'

# Example prompt output:
# user@SRB /home/user> 

def display_prompt
  print ColorizedString[display_user].colorize(:light_green)
  print ColorizedString['SRB'].colorize(:light_green)
  print ': '
  print ColorizedString["#{Dir.pwd}"].colorize(:light_blue)
  print '> '
end

def display_user
  (OS.windows? ? ENV['USERNAME'] : ENV['USER']) + '@'
end

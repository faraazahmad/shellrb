require_relative "require"
require_all_packages

def exit_condition?(command)
  if command == "exit" || command == "quit"
    true
  end
end

command_count = 0
loop do
  print "0.0.1 :#{command_count} > "
  command = gets.gsub("\n", "").to_sym
  send(command)
  command_count += 1
  break if exit_condition? command
end

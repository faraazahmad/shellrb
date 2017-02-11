require_relative "system"
require_relative "require"
require_all_packages

command_count = 0
loop do
  print "#{Dir.pwd} >"
  input = gets.gsub("\n", "").split(" ")
    if input[0] != ""
      command = input[0].to_sym
      params = input[1..input.length]
      send command, params
  end
end

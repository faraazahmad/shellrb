require_relative "require"
require_all_packages

command_count = 0
loop do
  display_prompt
  input = gets.gsub("\n", "").split(" ")
    if input[0] != ""
      command = input[0].to_sym
      params = input[1..input.length]
      send command, params
  end
end

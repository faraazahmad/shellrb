require_relative "require"
require_all_packages

loop do
  Display.display_prompt
  input = gets.gsub("\n", "").split(" ")
    if input[0] != ""
      command = input[0].capitalize.to_sym
      params = input[1..input.length]
      Core.handle_commands command, params
  end
end

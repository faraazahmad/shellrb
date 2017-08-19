require_relative "require"
require_all_packages

def handle_commands(command, params)
  c = Object.const_get(command)
  c.send(:main, params)
rescue NameError => e
  puts "Command \'#{command.downcase}\' not found"
end

def init_history(filename)
  File.open(Dir.home + '/' + filename, "a+")
end

$hist_file = init_history('.srb_history')
loop do
  display_prompt
  raw_input = gets
  handle_commands(:Exit, nil) if raw_input.nil?
  $hist_file.puts raw_input
  input = raw_input.gsub("\n", "").split(" ")
    if input[0] != ""
      command = input[0].capitalize.to_sym
      params = input[1..input.length]
      handle_commands(command, params)
    end
end

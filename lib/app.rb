require_relative 'require'
require_all_packages

def handle_commands(command, params)
  c = Object.const_get(command)
  c.send(:main, params)
rescue NameError
  puts "Command \'#{command.downcase}\' not found"
end

Core.init_history
loop do
  begin
    # Display the prompt and get command from user
    display_prompt
    raw_input = gets.chomp

    unless raw_input.empty?
      # If command was not empty, log it in .srb_history
      Core.log_history raw_input
      
      input = raw_input.split(' ')
      command = input[0].capitalize.to_sym
      params = input[1..input.length]
      handle_commands(command, params)
    end
  # the following rescue block helps in dealing with empty input
  rescue
    next
  end
end

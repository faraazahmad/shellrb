require "yaml"

def systeminfo
  puts "ShellRB"
  puts "version: 0.0.2"
end

def system(params)
  case params[0]
    when "exit"
      exit
    when "info"
      systeminfo
  end
end

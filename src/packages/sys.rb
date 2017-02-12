require "psych"

def info
  sysinfo = Psych.load_file("#{File.dirname(__FILE__)}/../config.yml")
  sysinfo.each do |param|
    puts param
  end
end

def sys(params)
  case params[0]
    when "--exit", "-e"
      exit
    when "--info", "-i"
      info
  end
end

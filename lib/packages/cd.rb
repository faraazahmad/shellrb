require "set"
require_relative "core"

class Cd

  def self.main params
    path = params[0]

    if path_exists? path
      # automatically cds into the path and checks for valid path
    else
      result = Set.new
      result.add "#{self.name.downcase}: specified Path does not exist"
      Core.print_result result
    end
    
  end

  def self.path_exists? target_path
    current_path = Dir.pwd
    target_path = target_path.split "/"
    
    unless target_path[0] == ""
      if Dir.entries(Dir.pwd).include? target_path[0]
        Dir.chdir target_path[0]
        target_path -= [target_path[0]]
      end
    end
  end

end

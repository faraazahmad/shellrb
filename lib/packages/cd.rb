require "set"
require_relative "core"

class Cd

  def self.main params
    path = params[0]

    if path_exists? path
      # automatically checks for valid path and cds into it
    else
      result = Set.new
      result.add "#{self.name.downcase}: specified Path does not exist"
      Core.print_result result
    end
    
  end

  def self.path_exists? target_path
    current_path = Dir.pwd
    target_path = target_path.split "/"

    exists = true

    until target_path.length == 0 do
      list = Dir.entries Dir.pwd
        if list.include? target_path[0]
          Dir.chdir target_path[0]
          target_path -= [target_path[0]]
        else
          Dir.chdir current_path
          exists = false
          break
        end
        return exists
      end
    end

end

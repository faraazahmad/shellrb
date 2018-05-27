require 'set'
require_relative 'core'

class Cd
  def self.main params
    path = params[0]
    if path.nil?
      # Dir.chdir with no arguements changes to Dir.home, as does cd from coreutils
      Dir.chdir
    else
      begin
        Dir.chdir path
      rescue SystemCallError
        result = Set.new
        result.add "#{self.name.downcase}: specified path does not exist"
        Core.print_result result
      end
    end
  end
end

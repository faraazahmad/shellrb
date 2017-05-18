require "set"
require_relative "core"

class Pwd

	def self.main params
		result = Set.new
		result.add Dir.pwd
			
		Core.print_result result
	end

end



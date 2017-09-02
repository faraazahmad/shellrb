class Echo
	def self.main params
		if params[0] == '-n'
			print params[1..(params.length - 1)].join(" ")
		else
			puts params[0..(params.length - 1)].join(" ")
		end
	end
end


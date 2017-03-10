require "psych"
require "set"

class Sys

  def self.main(params)
    result = Set.new

    case params[0]
    when "--exit", "-e"
      exit
    when "--info", "-i"
      result = info
    end
    Core.print_result(result)
  end

  def self.info
    info_set = Set.new

    # Psych.load returns a hash
    info_hash = Psych.load_file("#{File.dirname(__FILE__)}/../config.yml")

    info_hash.each do |property, value|
      description = "#{property}: #{value}"
      info_set.add description
    end
    info_set
  end

end

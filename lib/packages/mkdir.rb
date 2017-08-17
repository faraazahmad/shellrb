require "set"
require_relative "core"

class Mkdir 

  def self.main params
    directory_names.each do |directory_name|
      Dir.mkdir(directory_name) unless File.exists?(directory_name)
    end
  end
end

#Simple implementation of unix copy command cp
require_relative 'ls'
require 'fileutils'
require 'set'

class Cp
  def self.main params
    begin
      src = params[0]
      dest = params[1]
      if src.to_s.empty? || dest.to_s.empty?
      	puts "usage: \tcp source_file target_file"
      	puts "\tcp source_file ... target_directory"
      	return 
      end
      FileUtils.cp(src, dest)
    rescue StandardError => e
      puts e.message
    end
  end
end
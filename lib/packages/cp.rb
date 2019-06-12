#Simple implementation of unix copy command cp
require 'fileutils'

class Cp
  def self.usage
    puts "usage: \tcp [-r] source_file target_file"
    puts "\tcp [-r] source_file ... target_directory"	
  end
  def self.main params
    begin
      if params.length == 2
        src = params[0]
        dest = params[1]
        if src.to_s.empty? || dest.to_s.empty?
          usage()     	  
      	  return 
        end
        FileUtils.cp(src, dest)
      elsif params.length == 3
        #Recursive copying
        if params[0].eql? "-r"
      	  src = params[1]
      	  dest = params[2]
      	  if src.to_s.empty? || dest.to_s.empty?
      	    usage()
      	    return
      	  end
      	  FileUtils.cp_r(src, dest)
        else
          usage()
          return
        end
      else
      	usage()
      	return 
      end  
    rescue StandardError => e
      puts e.message
    end
  end
end

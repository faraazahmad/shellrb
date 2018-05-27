require_relative 'ls'
require 'set'
require 'fileutils'

class Mkdir
  def self.main params
    # user passes the name of the directory to be created as the first parameter
    new_directory = params[0]

    # creates a set of all the directorys in the current directory
    ls = Ls.show_hidden.merge Ls.show_non_hidden

    directory_present = false

    # iterates through the directorys in the current directory to make sure that the desired directory does not exist
    ls.each do |x|
      if x == new_directory
        directory_present = true
        break
      end
    end

    # creates the directory if it does not exist already, throws an error if the directory does exist

    if directory_present
      puts "mkdir: #{new_directory}: File exists"
    else
      FileUtils.mkdir(new_directory)
    end

  end
end

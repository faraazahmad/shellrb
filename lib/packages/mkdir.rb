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

    # creates the directory if it does not exist already
    # NOTE: I thought about showing an error message if the directory already exists, but the original touch command does not do this.
    # That can be added easily if deemed necessary.
    unless directory_present
      Dir.mkdir(new_directory)
    else
      puts "mkdir: #{new_directory}: File exists"
    end

  end
end

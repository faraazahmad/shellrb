# a basic cat command for shellrb
# TODO: add options/flags
class Cat
  def self.main params
    # opens the file passes as a parameter for reading
    file = File.new(params[0], 'r')
    # iterates through every line in the file and puts it to the console
    while (line = file.gets)
      puts "#{line}"
    end
    # closes the file
    file.close
  # this rescue block catches an exception, presumably by the user passing a missing file as an argument
  # the text that it puts tells the user that no such file is found, emulates the same error message given by bash
rescue
    puts "cat: #{params[0]}: No such file or directory"
  end
end

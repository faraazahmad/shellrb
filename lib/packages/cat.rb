# a basic cat command for shellrb
# TODO: add options/flags
class Cat
  def self.main params
    # read the file whose name has been passed as the parameter, line-by-line
    params.each do |p|
      File.foreach(p) do |line|
        puts line
      end
    end

    rescue
      # this rescue block catches an exception, presumably by the user passing a
      # missing file or a directory as an argument
      if File.directory?(params[0])
        error = "Is a directory"
      else
        error = "No such file or directory"
      end
      puts "cat: #{params[0]}: #{error}"
  end
end

# basic web file downloader for shellrb
require 'open-uri'
class Wget
  def self.main params
    begin
      # opens file from web
      file = open(params[0])
    rescue # rescues if file doesn't exist (404)
      puts "wget: #{params[0]}: file not found"
      return
    end
    begin
      # makes file available in filesystem
      # with filename passed as param 1
      IO.copy_stream(file, params[1])
    rescue # rescues if file is not writable to disk
      puts "wget: #{params[1]}: file not writable"
      return
    end
    puts "File succesfully downloaded as #{params[1]}"
  end
end

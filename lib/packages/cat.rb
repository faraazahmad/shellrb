class Cat
  def self.main params
    file = File.new(params[0], 'r')
    while (line = file.gets)
      puts "#{line}"
    end
    file.close
  rescue Exception => e
    puts "cat: #{params[0]}: No such file or directory" 
  end
end



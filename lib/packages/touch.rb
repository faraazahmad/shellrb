class Touch
  def self.main params
    fileExists = false
    `ls`.each do |x|
      if params[0] == x
        fileExists = true
      end
    end

    if fileExists?
      puts "File already exists"
    else
      File.open(params[0], w)
    end
  end
end


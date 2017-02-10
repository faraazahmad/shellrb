def require_all_packages

  directory = "#{Dir.pwd}/src/packages"
  files = Dir.entries directory

  files.each do |file|
    if file.include? ".rb"
      require_relative "#{directory}/#{file.gsub ".rb", ""}"
    end
  end

end

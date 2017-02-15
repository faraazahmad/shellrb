def require_all_packages

  package_directory = "#{File.dirname(__FILE__)}/packages"
  files = Dir.entries package_directory

  files.each do |file|
    if file.include? ".rb"
      require_relative "#{package_directory}/#{file.gsub ".rb", ""}"
    end
  end

end

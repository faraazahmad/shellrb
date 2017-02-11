def require_all_packages

  packages_directory = "#{File.dirname(__FILE__)}/packages"
  files = Dir.entries packages_directory

  files.each do |file|
    if file.include? ".rb"
      require_relative "#{directory}/#{file.gsub ".rb", ""}"
    end
  end

end

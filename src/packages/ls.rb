def ls
  directory = "#{Dir.pwd}/src/packages"
  puts Dir.entries(directory)
end

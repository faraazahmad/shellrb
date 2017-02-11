def show_all
  Dir.entries(Dir.pwd).each do |entry|
    print "#{entry}\t"
  end
  print "\n"
end

def show_non_hidden
  Dir.entries(Dir.pwd).each do |entry|
    print "#{entry}\t" unless entry[0] == "."
  end
end

def ls(params)
  if params.length == 0
    show_non_hidden
  else
    case params[0]
      when "-a"
        show_all
    end
  end
end

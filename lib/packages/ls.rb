require "set"

class Ls

  def self.main(params)
    result = Set.new

    if params.length == 0
      result = show_non_hidden
    else
      case params[0]
      when "-a"
        result = show_non_hidden.merge show_hidden
      else
        result.add "#{self.name.downcase}: Unknown argument \'#{params[0]}\'"
      end
    end

    print_result(result)
  end

  def self.print_result(result)
    result.each do |entry|
      puts entry
    end
  end

  def self.show_hidden
    hidden_files = Set.new

    Dir.entries(Dir.pwd).each do |entry|
      hidden_files.add entry if entry[0] == "."
    end
    hidden_files
  end

  def self.show_non_hidden
    non_hidden = Set.new

    Dir.entries(Dir.pwd).each do |entry|
      non_hidden.add entry unless entry[0] == "."
    end
    non_hidden
  end

end

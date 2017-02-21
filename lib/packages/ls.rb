require "set"

class Ls

  def self.main(params)
    if params.length == 0
      show_non_hidden
    else
      case params[0]
      when "-a"
        show_non_hidden.merge show_hidden
      end
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

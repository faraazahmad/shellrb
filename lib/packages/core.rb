# core shell
class Core

  def self.main params

  end

  def self.init_history
    $hist_file = File.open("#{Dir.home}/.srb_history", 'a+')
  end

  def self.log_history command
    $hist_file.puts command
  end

  # def self.load_profile
  # end

  def self.print_result result
    result.each do |value|
      print value.to_s
    end
    puts ''
  end

  def self.unknown_param param

  end

end

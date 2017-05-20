require_relative "display"

class Core

  def self.main params

  end

  # def self.log_history command
  # end

  # def self.load_profile
  # end

  def self.print_result result
    result.each do |value|
      puts value
    end
  end

  def self.unknown_param command, param
    error = "#{command}: Unknown parameter \'#{param}\'"
    Display.print_error error
  end

  def self.handle_commands command, params
    if Object.const_defined? command
      c = Object.const_get command
      c.send :main, params
    else
      error = "Command \'#{command.downcase}\' not found"
      Display.print_error error
    end
  end

end

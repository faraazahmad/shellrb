# This is class is a temporary replacement
# for running native shell commands. the
# safety of commands run using this class
# is not guarenteed by ShellRB. So use it 
# at your own risk.

class Unsafe

    def self.main params
      shell_command = params.join " "
      
      # 'system' is an in-built Ruby function
      # that executes native shell commands.
      # 'system' takes in a String argument
      # and runs that as a native command.
      
      system shell_command
    end
    
end

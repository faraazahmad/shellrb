require 'packages/help'

describe Help do

    describe '.main' do
        context 'when command is executed' do
            it 'shows all currently available functions' do
                # lib_files = Dir.entries('../../lib/packages')
                # commands = lib_files.map{|command| command.include?('rb') ? command[0..-4] : command}
                expect(Help.main('').to output('').to_stdout
            end
        end
    end

end
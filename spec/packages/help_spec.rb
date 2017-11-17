require 'packages/help'

describe Help do

    describe '.main' do
        context 'when command is executed' do
            it 'shows all currently available functions' do
                expect(Help.main('')).to eql(Help.no_params)
            end
        end
    end

end
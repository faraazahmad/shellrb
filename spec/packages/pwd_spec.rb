require 'packages/pwd'

describe Pwd do

    describe '.main' do
        context 'when command is executed' do
            it 'shows the current directory' do
                expect(Pwd.main('')).to eql(Pwd.no_params)
            end
        end
    end

end
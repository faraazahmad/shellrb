require 'packages/pwd'

describe Pwd do

    describe '.main' do
        context "when command is executed" do
            it 'shows the current directory' do
                expect(Pwd.main()).to eql(Dir.pwd)
            end
        end
    end

end
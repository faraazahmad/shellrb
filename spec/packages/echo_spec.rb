require 'packages/echo'

describe Echo do

  describe ".main" do

    context "not given -n" do
      it "prints the text with a newline" do
        params = ["Hello", "world!"]
        expect(Echo.main(params)).to eql(puts params[0..1].join(' '))
      end
    end

    context "given -n" do
      it "prints the text without a newline" do
        params = ["-n", "Hello", "world!"]
        expect(Echo.main(params)).to eql(print params[1..2].join(' '))
      end
    end

  end

end




require "packages/cat"

describe Cat do
  
  describe ".main" do

    context "given existing file" do
      it "prints the text in the file" do
        f = File.open('file.txt', 'w')
        f.write("Hello World!")
        f.close
        expect(Cat.main("file.txt")).to eql(puts `cat file.txt`)
        `rm file.txt`
      end
    end

    context "given non-existing file" do
      it "prints error message" do
        expect(Cat.main('text.txt')).to eql(puts `cat text.txt`)
      end
    end


  end

end  

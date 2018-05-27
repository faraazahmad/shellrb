require "packages/cat"

describe Cat do
  describe ".main" do

    context "given existing file" do
      it "prints the text in the file" do
        File.write("file.txt", "Hello World!")
        expect(Cat.main("file.txt")).to eql(puts `cat file.txt`)
        `rm file.txt`
      end
    end

    context "given non-existing file or directory" do
      it "prints error message" do
        expect(Cat.main("text.txt")).to eql(puts `cat text.txt`)
      end
    end

  end
end

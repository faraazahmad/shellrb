require "packages/cat"

describe Cat do
  
  describe ".main" do

    context "given existing file" do
      it "prints the text in the file" do
        expect(Cat.main('cat_test/file.txt')).to eql(Kernel.system 'cat cat_test/file.txt')
      end
    end

    context "given non-existing file" do
      it "prints error message" do
        expect(Cat.main('text.txt')).to eql(Kernel.system 'cat text.txt')
      end
    end


  end

end  

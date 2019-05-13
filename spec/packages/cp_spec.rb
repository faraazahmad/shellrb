require 'packages/cp'

describe Cp do

  describe ".main" do
  
    context "given existing source file" do
      it "copies file" do
        params = ["./README.md", "readme.txt"]
        expect(Cp.main(params)).to eql(puts "")
        `rm readme.txt`
      end
    end
    
    context "given nonexistent file" do
      it "returns with error" do
        params = ["filethatdoesntexist", "file.txt"]
        expect(Cp.main(params)).to eql(puts "No such file or directory @ rb_sysopen - filethatdoesntexist")
      end
    end
    
    context "given bad write filename" do
      it "returns with error" do
        params = ["./README.md", ".//filename//wont//work//"]
        expect(Cp.main(params)).to eql(puts "No such file or directory @ rb_sysopen - .//filename//wont//work//")
      end
    end
    
  end

end

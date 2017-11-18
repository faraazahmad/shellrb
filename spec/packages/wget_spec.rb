require 'packages/wget'

describe Wget do

  describe ".main" do
  
    context "given existing file" do
      it "downloads file" do
        params = ["https://raw.githubusercontent.com/faraazahmad/shellrb/master/README.md", "readme.txt"]
        expect(Wget.main(params)).to eql(puts "File succesfully downloaded as #{params[1]}")
        `rm readme.txt`
      end
    end
    
    context "given nonexistent file" do
      it "returns with error" do
        params = ["filethatdoesntexist", "file.txt"]
        expect(Wget.main(params)).to eql(puts "wget: #{params[0]}: file not found")
      end
    end
    
    context "given bad write filename" do
      it "returns with error" do
        params = ["https://raw.githubusercontent.com/faraazahmad/shellrb/master/README.md", ".//filename//wont//work//"]
        expect(Wget.main(params)).to eql(puts "wget: #{params[1]}: file not writable")
      end
    end
    
  end

end

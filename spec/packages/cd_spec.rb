require "packages/cd"

describe Cd do

  describe ".main" do
    context "given existing directory" do
      it "CDs into the directory" do
        Cd.main(["/home"])
        expect(Dir.pwd).to eql("/home")
      end
    end
  end

=begin
  describe ".path_exists?" do
    context "given a path" do
      it "checks for path validity" do
        
      end
    end
  end
=end
  
end

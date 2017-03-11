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

end

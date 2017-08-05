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

  describe ".main" do
    context "given non-existent directory" do
      it "does not change directory" do
        old_path = Dir.pwd
        Cd.main(["does-not-exist"])
        expect(Dir.pwd).to eql(old_path)
      end
    end
  end

  describe ".main" do
    context "given a file" do
      it "does not change directory" do
        old_path = Dir.pwd
        Cd.main(["lib/packages/cd.rb"])
        expect(Dir.pwd).to eql(old_path)
      end
    end
  end

end

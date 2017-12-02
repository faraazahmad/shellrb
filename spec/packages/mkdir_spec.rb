require "packages/mkdir"

describe Mkdir do
  describe ".main" do

    context "given new directory" do
      it "creates the directory" do
        Mkdir.main(["Mkdir.test"])

        expect(Dir.exists?("Mkdir.test")).to eql(true)
        Dir.delete("Mkdir.test")
      end
    end

    context "given existing directory" do
      it "does not create the directory" do
        Dir.mkdir("directorytest")
        expect(Mkdir.main(["directorytest"])).to eql(puts "mkdir: directorytest: File exists")
        Dir.delete("directorytest")
      end
    end

  end
end

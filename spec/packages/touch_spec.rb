require "packages/touch"

describe Touch do
  describe ".main" do
  
    context "given new file" do
      it "creates the file" do
        Touch.main(["touch.test"])
        
        expect(File.exists?("touch.test")).to eql(true)
        `rm touch.test`
      end
    end

    context "given existing file" do
      it "does nothing" do
        File.write("touch.test", "")
        expect(Touch.main("touch.test")).to eql(puts "")
        `rm touch.test`
      end
    end
    
  end
end


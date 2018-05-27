require "packages/ls"

describe Ls do

  describe ".main" do
    context "given any parameter" do
      it "calls the right method" do

        # check whether main("") shows only non hidden files
        expect(Ls.main("")).to eql(Ls.show_non_hidden)

        # Merge hidden and non_hidden Sets and check for equality with main(["-a"])
        expect(Ls.main(["-a"])).to eql(Ls.show_non_hidden.merge(Ls.show_hidden))
      end
    end
  end

  describe ".show_hidden" do
    context "when called" do
      it "shows the hidden files" do
        Ls.show_hidden.each do |entry|

          # check if each entry is hidden
          expect(entry[0]).to eql(".")
        end
      end
    end
  end

  describe ".show_non_hidden" do
    context "when called" do
      it "shows only non hidden files" do
        Ls.show_non_hidden.each do |entry|

          # Verify whether each entry is non hidden
          expect(entry[0]).not_to eql(".")
        end
      end
    end
  end

end

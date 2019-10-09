require "packages/cp"

describe Cp do
  describe ".main" do
    context "Copy a file" do
      before do
        File.write("file.txt", "Hello World!")
      end

      it "should have identical content in the destination file" do
        FileUtils.mkdir("testing")
        Cp.main(%w(file.txt testing/new_file.txt))
        expect(FileUtils.identical?("file.txt","testing/new_file.txt")).to be_truthy
      end

      it "should have the file in the destination directory" do
        FileUtils.mkdir("testing")
        Cp.main(%w(file.txt testing))
        expect(File.exist?("testing/file.txt")).to be_truthy
      end

      it "should show error if source file is not found" do
        FileUtils.mkdir("testing")
        Cp.main(%w(file1.txt testing/new_file.txt))
        expect {Cp.main(%w(file1.txt testing/new_file.txt))}.to output("cp: No such file or directory @ rb_sysopen - file1.txt\n").to_stdout
      end

      it "should show error if destination folder is not found" do
        Cp.main(%w(file1.txt testing/new_file.txt))
        expect {Cp.main(%w(file.txt testing/new_file.txt))}.to output("cp: No such file or directory @ rb_sysopen - testing/new_file.txt\n").to_stdout
      end

      after do
        File.delete("file.txt")
        FileUtils.rm_rf("testing")
      end
    end

    context "Copy multiple files to another directory" do
      it "should have copied all the files to destination directory" do
        File.write("file1.txt", "Hello World!")
        File.write("file2.txt", "Hello World!")
        FileUtils.mkdir("testing")
        Cp.main(%w(file1.txt file2.txt testing))
        expect(File.exist?("testing/file1.txt")).to be_truthy
        expect(File.exist?("testing/file2.txt")).to be_truthy
        File.delete("file1.txt")
        File.delete("file2.txt")
        FileUtils.rm_rf("testing")
      end
    end

    context "Copy directory to directory" do
      before do
        FileUtils.mkdir("testing")
        File.write("testing/file1.txt", "Hello World!")
        File.write("testing/file2.txt", "Hello World!")
      end

      it "should create destination directory and copy all files of source directory" do
        Cp.main(%w(-r testing testing1))
        expect(File.exist?("testing1/file1.txt")).to be_truthy
        expect(File.exist?("testing1/file2.txt")).to be_truthy
      end
      it "should have copied the source directory as sub-directory inside destination directory if destination directory exists" do
        FileUtils.mkdir("testing1")
        Cp.main(%w(-r testing testing1))
        expect(File.exist?("testing1/testing/file1.txt")).to be_truthy
        expect(File.exist?("testing1/testing/file2.txt")).to be_truthy
      end
      after do
        FileUtils.rm_rf("testing")
        FileUtils.rm_rf("testing1")
      end
    end
  end
end

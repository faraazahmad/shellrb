require "packages/cp"

describe Cp do
  describe ".main" do
    context "without arguments" do
      it "should display usage" do
        expect { Cp.main([]) }
          .to output("usage:\tcp [-R] source_file target_file\n\tcp [-R] source_file ... target_directory\n").to_stdout
      end
    end

    context "copy one file" do
      before do
        File.write("file.txt", "Fake file content")
      end

      after do
        File.delete("file.txt")
        FileUtils.rm_rf("target")
      end

      it "should copy a file to the destination file" do
        FileUtils.mkdir("target")
        Cp.main(%w(file.txt target/file.txt))
        expect(
          File.exist?("target/file.txt")
        ).to be true
        expect(
          FileUtils.identical?("file.txt","target/file.txt")
        ).to be true
      end

      it "should display error when source file does not exist" do
        FileUtils.mkdir("target")
        expect { Cp.main(%w(notafile.txt target/new_file.txt)) }
          .to output("cp: No such file or directory @ rb_sysopen - notafile.txt\n").to_stdout
      end

      it "should display error when destination directory does not exist" do
        expect { Cp.main(%w(file.txt notadir/new_file.txt)) }
          .to output("cp: No such file or directory @ rb_sysopen - notadir/new_file.txt\n").to_stdout
      end
    end

    context "copy multiple files into a directory" do
      before do
        File.write("file_one.txt", "Fake file content")
        File.write("file_two.txt", "Yet more fake file content")
      end

      after do
        File.delete("file_one.txt")
        File.delete("file_two.txt")
        FileUtils.rm_rf("target")
      end

      it "should copy all files to the destination directory" do
        FileUtils.mkdir("target")
        Cp.main(%w(file_one.txt file_two.txt target))
        expect(
          File.exist?("target/file_one.txt")
        ).to be true
        expect(
          File.exist?("target/file_two.txt")
        ).to be true
        expect(
          FileUtils.identical?("file_one.txt","target/file_one.txt")
        ).to be true
        expect(
          FileUtils.identical?("file_two.txt","target/file_two.txt")
        ).to be true
      end

      it "should display error when a source file does not exist" do
        FileUtils.mkdir("target")
        expect { Cp.main(%w(file_one.txt notafile.txt target)) }
          .to output("cp: No such file or directory @ rb_sysopen - notafile.txt\n").to_stdout
      end

      it "should display error when destination directory does not exist" do
        expect { Cp.main(%w(file_one.txt file_two.txt notadir)) }
          .to output("cp: No such file or directory @ rb_sysopen - notadir/file_one.txt\n").to_stdout
      end
    end

    context "copy one directory into a directory" do
      before do
        FileUtils.mkdir("source")
        File.write("source/file_one.txt", "Fake file content")
        File.write("source/file_two.txt", "Yet more fake file content")
      end

      after do
        FileUtils.rm_rf("source")
        FileUtils.rm_rf("target")
      end

      it "should create destination directory and copy all files from source directory" do
        Cp.main(%w(-R source target))
        expect(
          File.exist?("target/file_one.txt")
        ).to be true
        expect(
          File.exist?("target/file_two.txt")
        ).to be true
      end

      it "should create destination sub-directory and copy all files from source directory" do
        FileUtils.mkdir("target")
        Cp.main(%w(-R source target))
        expect(
          File.exist?("target/source/file_one.txt")
        ).to be true
        expect(
          File.exist?("target/source/file_two.txt")
        ).to be true
      end
    end
  end
end

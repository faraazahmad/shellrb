# Contributing
I like getting contributions from everyone. Having this contributing guide makes sure the repo has consistent code styles throughout and also to help out new contributers.

## Directory Structure
The repo is currently setup so that it is easy to add your code and the corresponding tests.
```
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── lib
│   ├── app.rb
│   ├── config.yml
│   ├── packages
│   │   ├── ...
│   └── require.rb
├── Rakefile
├── README.md
├── ShellRB.png
└── spec
    └── packages
        ├── ...
```
All commands in ShellRB are implemented as Ruby classes that live inside the folder `lib/packages` and their corresponding tests are in `spec/packages`. For example, if you have a package implementing the `pwd` command, it is a fairly simple Ruby class as follows: 
```Ruby
require 'set'
require_relative 'core'

class Pwd
  # Simply outputs the present working directory of the user
  def self.main params
    # Create new instance of Ruby data structure Set to add output to it
    # For more info on set: http://ruby-doc.org/stdlib-2.4.1/libdoc/set/rdoc/Set.html
    result = Set.new

    # TODO: Handle case when params are sent as input

    # Assuming no params have been sent
    result.merge self.no_params

    # Use the Core class of ShellRB to print result
    Core.print_result result
  end

  def self.no_params
    # Return a Set with content as Dir.pwd
    simple_result = Set.new
    simple_result.add Dir.pwd
  end
end
```
this package file is called, (quite simply) `pwd.rb` and its test file, `pwd_spec.rb` will be placed inside `spec/packages`.

## Code Style Guide
The code style guide is an important guide for contributors in any project.
ShellRB will now be following the community driven Ruby coding style guide.
You can check it out [here](https://github.com/bbatsov/ruby-style-guide). 

Any previous code that was written will be converted to this style guide.
You can report any code style violations by opening an issue with the label `code-style-violation`.

## Test files
##### "What do I test?"
Divide your package's functionality into parts that do specific tasks, as methods of their class. Then individually test those methods, and then finally test the `main` method of the class. Here's an example of the tests for the `cd` command: 
```Ruby
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
```

More info can be found in their [documentation](https://relishapp.com/rspec)

## What to commit?
Typically, if you're adding a new class for a command not yet implemented, you should have the class file for package and the corresponding test.

If you're adding a new feature to an existing package, tread carefully. First write failing tests for your feature, and then write code to make it pass. Test often, and test everything.

## You think you can improve the source and provide best practices that ShellRB doesn't follow yet?
Great! Open up an issue and explain it. Your contributions are most welcome!

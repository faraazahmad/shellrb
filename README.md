# ShellRB - Unix shell commands using Ruby

![ShellRB](ShellRB.png)

[![Build Status](https://travis-ci.org/faraazahmad/shellrb.svg?branch=master)](https://travis-ci.org/faraazahmad/shellrb)
[![Join the chat at https://gitter.im/shellrb/Lobby](https://badges.gitter.im/shellrb/Lobby.svg)](https://gitter.im/shellrb/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

ShellRB is a portable **(Windows/Linux/OS X)** implementation of Unix shell commands on top of the Ruby's modules. You can use it to eliminate your shell script's dependency on Unix while still keeping its familiar and powerful commands.

Inspired from [ShellJS/Shx](https://github.com/shelljs/shx)

## Example
Here's a sneak peek at how it feels to use ShellRB.
```
faraaz@SRB: /home/faraaz> ls
foo
bar
shellrb
...

faraaz@SRB: /> cd home
faraaz@SRB: /home>
faraaz@SRB: /home/faraaz> pwd
/home/faraaz

```

## Why ShellRB
I've been using Linux for my development environment ever since I jumped onto the open-source bandwagon. Often, I've wondered, what would people do if they really wanted to use a bash-like shell on Windows without the hassle of firing-up a Linux-based OS VM.

Enter ShellRB. The goal is to build a bash-like shell in Ruby that runs cross-platform, is easy to maintain (has tests for every feature), and is friendly to new contributors.

## Installation
Make sure you have Ruby and Git installed (pretty obvious, right?).

You will also need the ```Rake``` gem. You can install that using
```
gem install rake
```
#### On Linux/Mac OS
(You can also do this exact thing on Windows if you have Git and Ruby installed on your machine)

Clone the repository using git and cd into it.
```
git clone https://github.com/faraazahmad/shellrb.git
cd shellrb/
```
Install the required gems using bundler
```
bundle install
```
ShellRB is now installed. You can now run it using
```
ruby lib/app.rb
```

## Contributing
The commands in ShellRB are made available using packages containing a class of their name. The packages can be found in "lib/packages/" directory. The packages in the directory are automatically ```require```ed in the app. When adding a package, make sure to also add tests for it, with the maximum code coverage. We believe in Behaviour Driven Development.

## Code of Conduct
We highly appreciate good behaviour and kind treatment of others. See our [Code of Conduct](CODE_OF_CONDUCT.md)


# ShellRB - Unix shell commands using Ruby
ShellRB is a portable **(Windows/Linux/OS X)** implementation of Unix shell commands on top of the Ruby's modules. You can use it to eliminate your shell script's dependency on Unix while still keeping its familiar and powerful commands.

Inspired from [ShellJS/Shx](https://github.com/shelljs/shx)

## Example
Here's a sneak peek at how it feels to use ShellRB.
```
SRB /> ls
bin
dev
initrd.img
lib64
mnt
root
snap
tmp
vmlinuz
...

SRB /> cd home
SRB /home>

```

## Why ShellRB
I've been using Linux for my development environment ever since I jumped onto the open-source bandwagon. Often, I've wondered, what would people do if they really wanted to use a bash-like shell on Windows without the hassle of firing-up a Linux-based OS VM.

Enter ShellRB. The goal is to build a bash-like shell in Ruby that runs cross-platform, is easy to maintain (has tests for every feature), and is friendly to new contributors.

## Installation
Make sure you have Ruby and git installed (pretty obvious, right?)
and do not forget the Bundler gem.
#### On Linux/Mac OS
Clone the repository using git and cd into it.
```
git clone https://github.com/faraazhmad/shellrb.git
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

## Cheat Sheet
Currently, commands like ```cd```, ```ls``` etc. are packages built using classes, whose objects return a Ruby Set, which is then printed to the console. The following commands have a working class right now:
* cd
* ls
* sys
* core

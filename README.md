# VM Bootstrap (Development Environment)

I've recently had to rebuild my development environment more than I would like
across a number of different machines, and it takes time (too much).  As such
I started thinking about ways to make it easier to bootstrap a new
development environment VM if and when I do need to rebuild it.

## Tools Used to Bootstrap and Run the Environment

- [packer](http://packer.io)
- [VirtualBox](virtualbox.org)
- BASH Scripting

## Bootstrapping the Environment

- Firstly, ensure that you have both packer and VirtualBox installed and
available on the machine you wish to create the environment in.
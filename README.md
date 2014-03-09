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

Firstly, ensure that you have both packer and VirtualBox installed and
available on the machine you wish to create the environment in.  If you wish
to use the `Makefile` to run the configuration then I'd recommend installing
packer to `~/packer` but if you have installed elsewhere you can set the
`PACKER_HOME` environment variable and still use make.

Once you have the required software installed, you will be able to run
`make` in the folder where you have cloned this repository and things
should start to happen.

## TODO

This is still a work in progress, and I'm pleased with how it's coming along,
however, the following still need to be done:

- tweaking the [preseed](https://wiki.debian.org/DebianInstaller/Preseed)
  configuration to something other than default stable debian.

- implementing some way of intelligently tweaking preseed configuration data
  based on packer variables.  This might use preseed classes or a preseed
  configuration file generation step...

- __getting the machine to boot through to build and create an the expected
  output__

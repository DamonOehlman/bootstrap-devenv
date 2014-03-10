#!/usr/bin/env bash

# install.sh
# 
# This is a shell script that is designed to take a barebones ubuntu server
# install, and install the bits and pieces required to make it a functioning
# development desktop environment. Basically I've broken too many desktop
# configurations in the past so I now only work in a rebuildable VM environment
# that I know I can rebuild easily.
#
# To execute this script, run the following:
# 
# To be completed

# a few defines
VERSION_SOURCECODEPRO=1.017
VERSION_NODE=${VERSION_NODE-0.10.26}

# ensure we are synced to network time
echo 'initialpass' | sudo -S ntpdate pool.ntp.org
sudo hwclock --systohc --utc

# add some helpful ppas
sudo apt-add-repository -y ppa:gstreamer-developers/ppa
sudo apt-add-repository -y ppa:yorba/ppa

# update the list of available repos
sudo apt-get update

# install required dependencies to get up and running
sudo apt-get -y install \
    build-essential \
    curl unzip \
    git \
    xinit \
    awesome \
    synapse lxterminal

# clone dotfiles
if [[ ! -d ~/dotfiles ]]; then
  git clone https://github.com/DamonOehlman/dotfiles.git ~/dotfiles
fi

# initialise helpful links
rm -rf ~/.config
ln -s ~/dotfiles/config ~/.config
ln -fs ~/dotfiles/.bashrc-custom ~/.bashrc-custom

if [[ ! $(cat ~/.bashrc | grep bashrc-custom) ]];
then
  printf "\n. ~/.bashrc-custom\n" >> ~/.bashrc
fi

# ensure we have a Downloads folder
mkdir -p ~/Downloads

# install the adobe source code pro font
if [[ ! -d ~/.fonts/SourceCodePro ]]; then
  rm -rf ~/Downloads/SourceCodePro*
  wget http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-${VERSION_SOURCECODEPRO}.zip -O ~/Downloads/SourceCodePro.zip
  unzip ~/Downloads/SourceCodePro.zip -d ~/Downloads
  mkdir -p ~/.fonts
  mv ~/Downloads/SourceCodePro_* ~/.fonts/SourceCodePro
  fc-cache -vf
fi

# bring in bashinate
if [[ ! -e ~/bin/bashinate ]]; then
  mkdir -p ~/bin
  wget https://bitbucket.org/DamonOehlman/bashinate/raw/master/bashinate -O ~/bin/bashinate
  chmod a+x ~/bin/bashinate
fi

# install node
echo "Installing node v$VERSION_NODE"
~/bin/bashinate node $VERSION_NODE
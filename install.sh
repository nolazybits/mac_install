#!/bin/bash

printf "Installing your Mac please wait\n\n"

# update the system
# sudo softwareupdate -ia --verbose

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade

# install cake brew for the one fearing the terminal
brew cask install cakebrew

# install mas - install App Store app from command line
if test ! $(which brew)
then
  echo "  Installing MAS for you."
  brew install mas
fi

# John background switcher
mas install 907640277

# install the versions tap (beta/snapshot channel)
brew tap caskroom/versions

# path finder explorer (replace finder)
brew cask install path-finder

# iterm2 terminal
brew cask install iterm2

# vivaldi-snapshot browser
brew cask install vivaldi-snapshot

# vim editor
brew install vim

# keeweb password manager
brew cask install keeweb

# spotify
brew cask install spotify

# android file transfer
brew cask install android-file-transfer

# bear notes - id comes from mas search bear
mas install 1091189122

# gravit designer
mas install 1207744923

# canary email client
brew cask install canary

# charles web proxy
brew cask install charles

# docker
brew cask install docker
# now run the app

# dropbox
brew cask install dropbox
# now run the app

# etcher - image burner
brew cask install etcher

# flux - cooler warms as dark comes
brew cask install flux

# postman
brew cask install postman

# install spectacle window manager
brew cask install spectacle

# franz messaging app aggregator
brew cask install franz

# archives 
brew cask install the-unarchiver

# send videos to Apple TV or chrome cast
brew cask install beamer

# media player
brew cask install mpv

# replace search
brew cask install alfred

# install little-snitch, check connection out are authorised
brew cask install little-snitch

# vs code
brew cask install visual-studio-code

# termhere in path finder or finder
brew cask install termhere

# realpath needed for the dotfiles install
brew install coreutils

# remove notification when screensharing
brew cask install muzzle

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup 

# Installing dofiles
printf "Installing dotfiles\n\n"

cd ~ && git clone https://nolazybits@bitbucket.org/nolazybits/dotfiles.git ./.dotfiles
cd ./.dotfiles/ && git submodule init && git submodule update
sudo pip3 install -r dotdrop/requirements.txt
./dotdrop.sh install --profile osx

# run zsh for the first time to initiate it
zsh
chsh -s /bin/zsh

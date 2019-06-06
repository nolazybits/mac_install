#!/bin/bash

printf "Installing your Mac please wait\n\n"

# update the system
# sudo softwareupdate -ia --verbose

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade

# install the versions tap (beta/snapshot channel)
brew tap caskroom/versions

# APPLICATIONS
brew install zsh zsh-completions
chsh -s /bin/zsh

# alfred, replace search
brew cask install alfred

# android file transfer
brew cask install android-file-transfer

# canary email client
brew cask install canary

# install cake brew for the one fearing the terminal
brew cask install cakebrew

# charles web proxy
brew cask install charles

# realpath needed for the dotfiles install
brew install coreutils

# docker
brew cask install docker-edge

# dropbox
brew cask install dropbox

# etcher - image burner
brew cask install etcher

# flux - cooler warms as dark comes
brew cask install flux

# gif maker
brew cask install gifox

# google drive auto backup
brew cask install google-backup-and-sync

# google chrome browser
brew cask install google-chrome

# insomnia rest client
brew cask install insomnia

# intelliJ IDE
brew cask install intellij-idea

# iterm2 terminal
brew cask install iterm2

# keeweb password manager
brew cask install keeweb

# krita - photoshop like
brew cask install krita

# open office docs
brew cask install libreoffice

# nicer image viewer
brew cask install lightgallery

# install little-snitch, check connection out are authorised
brew cask install little-snitch

# media player
brew cask install mpv

# remove notification when screensharing
brew cask install muzzle

# path finder explorer (replace finder)
brew cask install path-finder

# plex client
brew cask install plex-media-player

# install spectacle window manager
brew cask install spectacle

# spotify
brew cask install spotify

# steam
brew cask install steam

# termhere in path finder or finder
brew cask install termhere

# archives 
brew cask install the-unarchiver

# vs code
brew cask install visual-studio-code

# vivaldi-snapshot browser, just to have another browser in case
brew cask install vivaldi-snapshot

# vlc media player, just in case mpv doesn't read the video
brew cask install vlc

# vim editor
brew install vim

# wavebox messaging app aggregator
brew cask install wavebox

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup 

# NOT INSTALLED AUTOMATICALLY BUT LISTED
# send videos to Apple TV or chrome cast
# brew cask install beamer



# MAS
printf "Installing apple store application, you will need to be logged in already\n\n"

# install mas - install App Store app from command line
if test ! $(which brew)
then
  echo "  Installing MAS for you, tool to install "
  brew install mas
fi

# bear notes - id comes from mas search bear
mas install 1091189122

# gravit designer
mas install 1207744923

# John background switcher
mas install 907640277

# Installing dofiles
printf "Installing dotfiles\n\n"

cd ~ && git clone https://nolazybits@bitbucket.org/nolazybits/dotfiles.git ./.dotfiles
cd ./.dotfiles/ && git submodule init && git submodule update
sudo pip3 install -r dotdrop/requirements.txt
./dotdrop.sh install --profile osx

# run zsh for the first time to initiate it
zsh
chsh -s /bin/zsh

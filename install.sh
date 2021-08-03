#!/bin/bash

printf "Installing your Mac please wait\n\n"

# update the system
sudo softwareupdate -ia --verbose

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# SYSTEM ----------------------------------------------------------------------

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade

# install the versions tap (beta/snapshot channel)
brew tap caskroom/versions

# fonts
brew tap homebrew/cask-fonts 

# realpath needed for the dotfiles install
brew install coreutils

# java cause it's always used
brew install java

# cause it's always used
brew install python3

read -p "Do you want to install system tools? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # alfred, replace search
    brew install alfred

    # android file transfer
    brew install android-file-transfer

    # properly remove all files of unsinstalled application
    brew install appcleaner

    # etcher - image burner
    brew install balenaetcher

    # install cake brew for the one fearing the terminal
    brew install cakebrew

    # disk space check
    brew install disk-inventory-x

    # flux - cooler warms as dark comes
    brew install flux

    # iterm2 terminal
    brew install iterm2

    # screen recording
    brew install kap

    # path finder explorer (replace finder)
    brew install path-finder

    # pdf read/write
    brew install pdf-expert

    # vpn
    brew install protonvpn

    # install spectacle window manager
    brew install rectangle

    # audio controller
    brew install soundsource

    # termhere in path finder or finder
    brew install termhere

    # ssh platfrom
    brew install termi

    # remove notification when screensharing
    brew install muzzle

    # archives 
    brew install the-unarchiver

    # vim editor
    brew install vim

    # office
    brew install wpsoffice

    # display management
    brew tap jakehilborn/jakehilborn && brew install displayplacer

fi


# DEVELOPMENT -----------------------------------------------------------------
read -p "Do you want to install development tools? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # clean git repo - https://rtyley.github.io/bfg-repo-cleaner/
    brew install bfg

    # charles web proxy
    brew install charles

    # docker
    brew install docker-edge

    # insomnia rest client
    brew install insomnia

    # intelliJ IDE
    brew install intellij-idea

    # code merge
    brew install meld

    # vs code
    brew install visual-studio-code
fi

# NETWORKING -----------------------------------------------------------------
read -p "Do you want to install networking tools? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # snif ip on network
    brew install angry-ip-scanner

    # install little-snitch, check connection out are authorised
    brew install little-snitch

    brew install zenmap
fi

# MEDIA -----------------------------------------------------------------
read -p "Do you want to install all misc tools? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # gif maker
    brew install gifox

    # ftp client
    brew install cyberduck

    # dropbox
    brew install dropbox

    # firefox 
    brew install firefox

    # google chrome browser
    brew install google-chrome

    # keeweb password manager
    brew install keeweb

    # Vector and image tools
    brew install affinity-designer affinity-photo

    # nicer image viewer
    brew install lightgallery

    # media player
    brew install mpv

    # plex client
    brew install plex-media-player

    # spotify
    brew install spotify

    # vlc media player, just in case mpv doesn't read the video
    brew install vlc

    # wavebox messaging app aggregator
    brew install wavebox

fi

# zsh 
brew install zsh zsh-completions

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup 

# NOT INSTALLED AUTOMATICALLY BUT LISTED
# send videos to Apple TV or chrome cast
# brew install beamer
# canary email client
# brew install canary
# flaoting window
# brew install pennywise
# brew install grammarly
# brew install gyazo
# video editing
# brew install lightworks
# brew install obs
# brew install openshot-video-editor
# brew install obs
# MAS
printf "Installing apple store application, you will need to be logged in already\n\n"

# install mas - install App Store app from command line
if test ! $(which mas)
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

# Hour - World Clock
mas install 569089415

# Installing dofiles
printf "Installing dotfiles\n\n"

cd ~ && git clone https://nolazybits@bitbucket.org/nolazybits/dotfiles.git ./.dotfiles
cd ./.dotfiles/ && git submodule init && git submodule update
sudo pip3 install -r dotdrop/requirements.txt
./dotdrop.sh install --profile osx

# run zsh for the first time to initiate it
zsh
chsh -s /bin/zsh

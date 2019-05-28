#!/bin/bash

printf "Checking for brew updates\n\n"

# update local package version with latest
brew update

# upgrade packages needing upgrade
brew upgrade

printf "Cleaning up brew\n\n"

# clean brew cache and remove any unlinked version (i.e not used)
brew cleanup -s

# now diagnotic
brew doctor
brew missing

printf "Outdated App Store App\n\n"
mas outdated

printf "Updating App Store\n\n"
echo Installing with mas upgrade
mas upgrade

printf "ALL DONE!\n\n"

#!/bin/bash

# clears the temporarly file if they exists.
rm -rf ln.sh dir.sh

# creates the folder structure if needed (mkdir -p).
# I want this to output $HOME without expansion cause bash it will execute it anyway, resolving the variable.
# shellcheck disable=SC2016
find linux/ -type f -not -path "*bin*" -exec dirname {} \; | sed 's#linux#$HOME#1' | sed 's#$HOME#mkdir -p $HOME#1' >> dir.sh && bash dir.sh

# looks for everything under the linux folder but the bin folder.
# I'm using a convention that everything under the linux folder it's like my $HOME directory on the host machine, 
# so it makes a symbolic link for each file found from the repository to the destination on the host.
# I want this to output $HOME without expansion cause bash it will execute it anyway, resolving the variable.
# shellcheck disable=SC2016
find linux/ -type f -not -path "*bin*" -exec echo ln -fs "${PWD}"/{} {} \; | sed 's#linux#$HOME#2' >> ln.sh && bash ln.sh

# clears the temporarly file again.
rm -rf ln.sh dir.sh

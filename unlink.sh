#!/bin/bash

# clears the temporarly file if they exists.
rm -rf rm.sh

# clears everything.
# I want this to output $HOME without expansion cause bash it will execute it anyway, resolving the variable.
# shellcheck disable=SC2016
find linux/ -type f -not -path "*bin*" -exec echo rm -rf {} \; | sed 's#linux#$HOME#1' >> rm.sh && bash rm.sh

# clears the temporarly file again.
rm -rf rm.sh

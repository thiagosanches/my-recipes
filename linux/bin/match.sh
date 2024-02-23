#!/bin/bash

# This script searches for a specific line stored in FILE1 and attempts to find a matching occurrence in FILE2.
# Usage: 
# ./match.sh file1.txt file2.txt

FILE1="$1"
FILE2="$2"

NO_COLOR="\033[0m"
RED_COLOR="\033[0;31m"
PURPLE_COLOR="\033[0;35m"

for t in $(cat "$FILE1")
do
    grep --quiet "${t}" "${FILE2}"
    if [[ $? -eq 0 ]]
    then
        echo -e "${t}\t${PURPLE_COLOR}MATCHES${NO_COLOR} in ${FILE2}"
    else
        echo -e "${t}\t${RED_COLOR}NO MATCH${NO_COLOR} in ${FILE2}"
    fi
done

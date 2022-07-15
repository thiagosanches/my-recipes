#!/bin/bash

if [ ! -f ~/.aws/credentials ]
then
    echo "$HOME/.aws/credentials file does not exists!"
    exit 1
fi

COUNT=0
grep -E "\[.*\]" ~/.aws/credentials | sed -e 's/\]//g' | sed 's/\[//g' | sort | uniq > all-aws-profile.txt
mapfile -t ARRAY < all-aws-profile.txt

echo "" > out.txt
grep -v '^ *#' < all-aws-profile.txt | while IFS= read -r line
do
    COUNT=$(echo $COUNT + 1 | bc)
    echo "$COUNT \"$line\" off" >> out.txt
done


OPTIONS=$(tr "\n" " " < out.txt)

INDEX=$(echo "$OPTIONS" | xargs dialog --radiolist "Select the AWS profile" 0 50 0 3>&1 1>&2 2>&3 3>&-)
INDEX=$(echo "$INDEX" - 1 | bc)
export AWS_PROFILE=${ARRAY[INDEX]}
clear

rm -rf all-aws-profile.txt out.txt

#!/bin/bash

if [ ! -f ~/.aws/credentials ]
then
    echo "~/.aws/credentials file does not exists"
    exit 1
fi

COUNT=0
cat ~/.aws/credentials | grep -E "\[.*\]" | sed -e 's/\]//g' | sed 's/\[//g' | sort | uniq > all-aws-profile.txt
mapfile -t ARRAY < all-aws-profile.txt

echo "" > out.txt
for i in $(cat all-aws-profile.txt)
do
    COUNT=$(echo $COUNT + 1 | bc)
    echo "$COUNT \"$i\" off" >> out.txt
done


OPTIONS=$(cat out.txt | tr "\n" " ")

INDEX=$(echo $OPTIONS | xargs dialog --radiolist "Select the AWS profile" 0 50 0 3>&1 1>&2 2>&3 3>&-)
INDEX=$(echo $INDEX - 1 | bc)
export AWS_PROFILE=${ARRAY[INDEX]}
clear

rm -rf all-aws-profile.txt out.txt

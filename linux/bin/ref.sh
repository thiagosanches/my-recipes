#!/bin/bash

REF_FILE=~/tools/reference.txt

function ref() {
    search_parameter=$@

    if [ -z "$search_parameter" ]; then
        code $REF_FILE
    else
		grep -i "$search_parameter" $REF_FILE
	OUTPUT=$(grep -i "$search_parameter" $REF_FILE | sed 's/==/\t/g' | awk '{ print $2 }')
		echo "$OUTPUT" | xclip
		echo "$OUTPUT"
    fi
}

#!/bin/sh
# shell script to prepend i3status with more stuff

TIMESTAMP=0
REFRESH_INTERVAL=60

i3status | while :
do
        read line
        
        # All custom info that don't need to be refreshed frequently, goes here.
        #if [ -n $TIMESTAMP ] && [ $(($(date +%s) - $TIMESTAMP)) -gt $REFRESH_INTERVAL ]
        #then
        #        TIMESTAMP=$(date +%s)
        #        AUDIO="$(~/r/my-recipes/linux/bin/playerctl.sh metadata)"
        #
        #        echo "It's time to refresh"
        #fi

        echo "$AUDIO | $line" || exit 1
done
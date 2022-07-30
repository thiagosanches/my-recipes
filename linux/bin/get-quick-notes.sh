#!/bin/bash

chosen=$(rofi -dmenu -i -p "Quick Notes" -no-custom < ~/.my-quick-notes.txt | sed 's/ .*//g')
printf '%s' "$chosen" | xclip -selection clipboard

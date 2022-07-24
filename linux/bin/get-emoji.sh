#!/bin/bash
chosen=$(rofi -dmenu -i -p "Emoji" -no-custom < ~/.config/emoji/emoji.txt | sed 's/ .*//g')
printf '%s' "$chosen" | xclip -selection clipboard

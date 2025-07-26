#!/bin/bash

# A bash script that utilizes rofi to display a list of executable AppImage files allowing us to select one from the list using rofi.

TOOLS_FOLDER=~/t/

chosen=$(find "$TOOLS_FOLDER" -type f -name "*.AppImage" -exec basename {} \; | sort | rofi -dmenu -i -p "AppImage")

if [ -n "$chosen" ]; then
    # Find full path of the selected AppImage
    full_path=$(find "$TOOLS_FOLDER" -type f -name "$chosen" -print -quit)
    if [ -n "$full_path" ]; then
        chmod +x "$full_path"
        # Execute the AppImage with nohup to detach from terminal
        nohup "$full_path" > /dev/null 2>&1 &
        exit 0
    fi
fi

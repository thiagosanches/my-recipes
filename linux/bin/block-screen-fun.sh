#!/bin/bash
# It blocks the screen with a screenshot letting people thinking the computer was not blocked.
rm -rf /tmp/image-screenshot.png
scrot -f /tmp/image-screenshot.png
i3lock -i /tmp/image-screenshot.png

#!/bin/bash
# It blocks the screen with a screenshot of what was in place.
scrot -f /tmp/image-screenshot.png
i3lock -i /tmp/image-screenshot.png

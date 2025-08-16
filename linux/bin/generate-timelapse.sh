#!/bin/bash

TIMELAPSE=$(date +%Y%m%d%H%M)
INPUT_FILE="timelapse-${TIMELAPSE}.txt"
OUTPUT_FILE="timelapse-${TIMELAPSE}.mp4"

# Create just a input file to concat the images on ffmpeg.
for i in $(ls *.jpg -v); do echo "file '$i'" >> "$INPUT_FILE"; done
ffmpeg -f concat -i "$INPUT_FILE" -framerate 30 -vcodec libx264 -threads 2 -b:v 10000k "$OUTPUT_FILE"
rm -rf "$INPUT_FILE"

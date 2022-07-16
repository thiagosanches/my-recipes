#!/bin/bash

while true
do
    FILENAME=$(date +%Y%m%d-%H-%M-%S.jpg)
    curl "http://192.168.15.11/cam-hi.jpg" -o "$FILENAME" --silent
    gsutil cp "$FILENAME" "gs://esp32cam-timelapse/$FILENAME"
    sleep 1;
    rm "$FILENAME"
done

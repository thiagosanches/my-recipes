#!/bin/bash

sudo kill -9 "$(ps aux | pgrep forticlient | awk '{print $2}' | tr "\n" " ")"
sudo sed 's/127.0.0.53/8.8.8.8/g' -i /etc/resolv.conf
cat /etc/resolv.conf

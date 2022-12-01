#!/bin/bash

wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb
sudo dpkg -i veracrypt-1.25.9-Ubuntu-22.04-amd64.deb

# to fix some missing dependency
sudo apt-get install -f

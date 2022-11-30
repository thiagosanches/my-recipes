#!/bin/bash

wget https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo dpkg --ignore-depends=libpango1.0-0 -i dropbox_2020.03.04_amd64.deb

# Now, you have to accept the warning and log in using your username and password, 
# to allow the access on this computer.
dropbox start -i

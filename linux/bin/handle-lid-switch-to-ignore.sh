#!/bin/bash
# It does nothing when the lid is closed.
sudo sed -r 's/#HandleLidSwitch=(.*)/HandleLidSwitch=ignore/g' -i /etc/systemd/logind.conf
sudo systemctl restart systemd-logind.service

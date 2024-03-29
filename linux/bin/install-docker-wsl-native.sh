#!/bin/bash
# Based on: https://github.com/codeedu/wsl2-docker-quickstart#instalar-o-docker-com-docker-engine-docker-nativo
# There is an issue on the Ubuntu22 that we need to perform the steps described here: https://crapts.org/2022/05/15/install-docker-in-wsl2-with-ubuntu-22-04-lts/

sudo apt update && sudo apt upgrade -y
sudo apt remove docker docker-engine docker.io containerd runc -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker "$USER"

#!/bin/bash

showMessage(){
  # Adding some color to the script :)
  ESC_SEQ="\x1b["
  RESET=$ESC_SEQ"39;49;00m"
  A=$ESC_SEQ"32;01m"
  echo -e "$A $1 $RESET"
}

BASE_FOLDER="/mnt/c/Users/Thiago"
REPOSITORIES_FOLDER="repositories"
TOOLS_FOLDER="tools"
GENERAL_FOLDER="general"

showMessage "Creating folders..."
mkdir "$BASE_FOLDER/$REPOSITORIES_FOLDER" 2>/dev/null
mkdir "$BASE_FOLDER/$TOOLS_FOLDER" 2>/dev/null
mkdir "$BASE_FOLDER/$GENERAL_FOLDER" 2>/dev/null

showMessage "Setting up my GIT config..."
git config --global user.name "Thiago Sanches"
git config --global user.email tsigwt@gmail.com

showMessage "Cloning my repositories..."
cd "$BASE_FOLDER/$REPOSITORIES_FOLDER"
git clone https://github.com/thiagosanches/my-recipes.git 2>/dev/null
git clone https://github.com/thiagosanches/trump-engine 2>/dev/null
git clone https://github.com/thiagosanches/trump-front-end 2>/dev/null
git clone https://github.com/thiagosanches/arisco 2>/dev/null

showMessage "Installing docker client..."
sudo apt-get update
sudo apt-get remove --yes docker docker-engine docker.io
sudo apt-get install --yes \
   apt-transport-https \
   ca-certificates \
   curl \
   software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get --yes install docker-ce

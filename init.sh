#!/bin/bash

TEMP_FOLDER=/tmp/my-recipes

mkdir $TEMP_FOLDER
cd $TEMP_FOLDER

# First clone my-recipes to reuse my bash functions
git clone https://github.com/thiagosanches/my-recipes.git 2>/dev/null

# Reusing my functions
[ -f $TEMP_FOLDER/utils/utils.sh ] && . $TEMP_FOLDER/utils/utils.sh

BASE_FOLDER="$1"
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

cd "$BASE_FOLDER/$REPOSITORIES_FOLDER"
showMessage "Cloning my repositories..."
git clone https://github.com/thiagosanches/my-recipes.git 2>/dev/null
git clone https://github.com/thiagosanches/trump-engine 2>/dev/null
git clone https://github.com/thiagosanches/trump-front-end 2>/dev/null
git clone https://github.com/thiagosanches/arisco 2>/dev/null

showMessage "Installing docker client..."
[ -f scripts/install-docker-ce-ubuntu.sh ] && . scripts/install-docker-ce-ubuntu.sh

rm -rf $TEMP_FOLDER 2>/dev/null

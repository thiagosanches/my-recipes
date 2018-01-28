#!/bin/bash

BASE_FOLDER="$1"
TEMP_FOLDER="$BASE_FOLDER/tmp"

# First clone my-recipes to reuse my bash functions.
git clone https://github.com/thiagosanches/my-recipes.git $TEMP_FOLDER

# Re-using my functions.
[ -f $TEMP_FOLDER/linux/utils/utils.sh ] && . $TEMP_FOLDER/linux/utils/utils.sh

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
git clone https://github.com/thiagosanches/my-recipes.git
git clone https://github.com/thiagosanches/trump-engine
git clone https://github.com/thiagosanches/trump-front-end
git clone https://github.com/thiagosanches/arisco

# Running my scripts.
cd $BASE_FOLDER/$REPOSITORIES_FOLDER/my-recipes

showMessage "Installing docker client..."
[ -f linux/scripts/install-docker-ce-ubuntu.sh ] && . linux/scripts/install-docker-ce-ubuntu.sh

rm -rf $TEMP_FOLDER 2>/dev/null

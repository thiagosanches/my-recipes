#!/bin/bash

BASE_FOLDER="$1"
TEMP_FOLDER="$BASE_FOLDER/tmp"

# First clone my-recipes to reuse my bash functions.
git clone https://github.com/thiagosanches/my-recipes.git "$TEMP_FOLDER"

# Re-using my functions.
# shellcheck source=linux/bin/utils.sh
[ -f "$TEMP_FOLDER"/linux/bin/utils.sh ] && . "${TEMP_FOLDER}"/linux/bin/utils.sh

REPOSITORIES_FOLDER="r"
TOOLS_FOLDER="t"
GENERAL_FOLDER="g"

showMessage "Creating folders..."
mkdir -p "$BASE_FOLDER/$REPOSITORIES_FOLDER" 2>/dev/null
mkdir -p "$BASE_FOLDER/$TOOLS_FOLDER" 2>/dev/null
mkdir -p "$BASE_FOLDER/$GENERAL_FOLDER" 2>/dev/null

showMessage "Setting up my GIT config..."
git config --global user.name "Thiago Sanches"
git config --global user.email tsigwt@gmail.com

cd "$BASE_FOLDER/$REPOSITORIES_FOLDER" || exit
showMessage "Cloning my repositories..."
git clone https://github.com/thiagosanches/my-recipes.git

# Running my scripts.
cd "$BASE_FOLDER"/"$REPOSITORIES_FOLDER"/my-recipes || exit

showMessage "Running some scripts..."
[ -f linux/scripts/install-docker-ce-ubuntu.sh ] && . linux/bin/install-docker-ce-ubuntu.sh
[ -f linux/scripts/install-i3.sh ] && . linux/bin/install-i3.sh


rm -rf "$TEMP_FOLDER" 2>/dev/null

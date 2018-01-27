#!/bin/bash

BASE_FOLDER="/c/Users/Thiago"
REPOSITORIES_FOLDER="repositories"
TOOLS_FOLDER="tools"
GENERAL_FOLDER="general"

echo "Creating folders..."
mkdir "$BASE_FOLDER/$REPOSITORIES_FOLDER"
mkdir "$BASE_FOLDER/$TOOLS_FOLDER"
mkdir "$BASE_FOLDER/$GENERAL_FOLDER"

echo "Cloning my repositories..."
cd "$BASE_FOLDER/$REPOSITORIES_FOLDER"
git clone https://github.com/thiagosanches/my-recipes.git
git clone https://github.com/thiagosanches/trump-engine
git clone https://github.com/thiagosanches/trump-front-end
git clone https://github.com/thiagosanches/arisco

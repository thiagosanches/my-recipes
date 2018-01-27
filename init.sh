#!/bin/bash

BASE_FOLDER="/c/Users/Thiago"
REPOSITORIES_FOLDER="repositories"
TOOLS_FOLDER="tools"
GENERAL_FOLDER="general"

echo "Creating folders..."
mkdir "$BASE_FOLDER/$REPOSITORIES_FOLDER" 2>/dev/null
mkdir "$BASE_FOLDER/$TOOLS_FOLDER" 2>/dev/null
mkdir "$BASE_FOLDER/$GENERAL_FOLDER" 2>/dev/null

echo "Setting up my GIT config..."
git config --global user.name "Thiago Sanches"
git config --global user.email tsigwt@gmail.com

echo "Cloning my repositories..."
cd "$BASE_FOLDER/$REPOSITORIES_FOLDER"
git clone https://github.com/thiagosanches/my-recipes.git 2>/dev/null
git clone https://github.com/thiagosanches/trump-engine 2>/dev/null
git clone https://github.com/thiagosanches/trump-front-end 2>/dev/null
git clone https://github.com/thiagosanches/arisco 2>/dev/null

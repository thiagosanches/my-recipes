#!/bin/bash

BASE_FOLDER="/c/Users/Thiago"
REPOSITORIES_FOLDER="repositories"
TOOLS_FOLDER="tools"
GENERAL_FOLDER="general"

echo "Creating folders..."
mkdir "$BASE_FOLDER/$REPOSITORIES_FOLDER"
mkdir "$BASE_FOLDER/$TOOLS_FOLDER"
mkdir "$BASE_FOLDER/$GENERAL_FOLDER"

echo "Clonning my-recipes"
cd "$BASE_FOLDER/$REPOSITORIES_FOLDER"
git clone https://github.com/thiagosanches/my-recipes.git

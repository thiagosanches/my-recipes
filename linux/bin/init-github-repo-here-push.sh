#!/bin/bash
# init-github-repo-here.sh

set -euo pipefail

# Get the PAT from topsecret folder.
GITHUB_PAT=$(cat ~/r/my-recipes/linux/bin/topsecret/github.secret)

# Get the name of the current directory where this script is being executed and use it as the repository name.
REPO_NAME=$(basename "$(pwd)")

# Create a new repository using the GitHub API, with a name that matches the current directory.
GIT_ORIGIN=$(curl -L \
-X POST \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $GITHUB_PAT" \
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/user/repos \
--data "{\"name\":\"$REPO_NAME\",\"private\":false}" | jq '.ssh_url' --raw-output)

# Now we can push the initial content to the newly created repository.
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin "$GIT_ORIGIN"
git push -u origin main

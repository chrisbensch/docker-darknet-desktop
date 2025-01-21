#!/bin/bash

# Define the repository URL and the directory name
REPO_URL="https://github.com/linuxserver/docker-webtop.git"
DIR_NAME="docker-webtop"

# Check if the directory already exists
if [ -d "$DIR_NAME" ]; then
    echo "Directory $DIR_NAME already exists. Pulling latest changes..."
    cd "$DIR_NAME" || exit
    git reset --hard
    git clean -fd
    git pull
    git switch debian-xfce
    cd ..
else
    echo "Directory $DIR_NAME does not exist."
fi

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
    echo "Directory $DIR_NAME does not exist. Cloning repository..."
    git clone "$REPO_URL" "$DIR_NAME"
    cd "$DIR_NAME"
    git switch debian-xfce
    cd ..
fi

cp i2p-install.expect "$DIR_NAME"/

# Append the contents of the source Dockerfile to the destination Dockerfile
cat Dockerfile.customization >> "$DIR_NAME"/Dockerfile

cd "$DIR_NAME"
docker buildx build . -t chrisbensch/docker-darknet-desktop:latest

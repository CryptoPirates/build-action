#!/bin/bash

echo "Configuring git"
git config --global url."https://${INPUT_GITUSERNAME}:${INPUT_GITACCESSTOKEN}@github.com".insteadOf "https://github.com"

echo "Installing docker"
apk add --update docker
service docker start

echo "Cloning ${GITHUB_REPOSITORY}"
git clone "https://github.com/${GITHUB_REPOSITORY}.git"
IFS='/'
read -ra ADDR <<< "${GITHUB_REPOSITORY}"
IDX=${#ADDR[@]}-1
REPONAME="${ADDR[${IDX}]}"
cd $REPONAME

echo "Building image from Dockerfile"
docker build \
    --build-arg "USERNAME=${INPUT_GITUSERNAME}" \
    --build-arg "ACCESSTOKEN=${INPUT_GITACCESSTOKEN}" \
    .

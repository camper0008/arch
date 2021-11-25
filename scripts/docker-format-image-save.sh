#!/bin/sh
set -e

# script to format the hashed folders `docker image save` outputs.
# useful for making docker images that build applications
# written by pieter (github.com/camper0008)

IMAGE_NAME=docker-format-image-save

# compatibility with windows git bash
SUDO="sudo"
if [[ "$OSTYPE" == "msys" ]];
then
	SUDO=""
fi

echo "Removing old temp files"
$SUDO rm -rf temp/ # doesn't like removing the hashed zip files without sudo

echo "Creating temp folders"
mkdir temp/
mkdir temp/out/hashed
mkdir temp/out/image

echo "Building docker image"
$SUDO docker image build . -t $IMAGE_NAME

echo "Saving docker image to file"
$SUDO docker image save $IMAGE_NAME -o temp/out/file.tar

echo "Unpacking saved docker image file"
cd temp/out/hashed
$SUDO tar -xf ../file.tar
$SUDO rm ../file.tar
cd ../../..

echo "Unpacking hashed files"
cd temp/out/image
ls -1 ../hashed/**/*.tar | xargs -i tar -xf '{}'
cd ../../..

echo "Finished, image is in temp/out/image"

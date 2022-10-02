#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export BUILD_VERSION=$3
echo Building docker image for $APPLICATION application with VERSION=$VERSION and BUILD_VERSION=$BUILD_VERSION

cd ~/git/$APPLICATION
docker build --build-arg VERSION=$VERSION -t starfireaviationllc/$APPLICATION:$BUILD_VERSION .

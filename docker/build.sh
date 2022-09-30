#!/bin/sh

export APPLICATION=$1
export VERSION=$2
echo Building docker image for $APPLICATION application with VERSION=$VERSION

docker build --build-arg VERSION=$VERSION -t starfireaviationllc/$APPLICATION:$VERSION .

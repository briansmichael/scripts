#!/bin/sh

export APPLICATION=$1
export VERSION=$2
echo Building docker image for $APPLICATION application with VERSION=$VERSION

sudo docker build --build-arg VERSION=$VERSION -t starfireaviation/$APPLICATION:$VERSION .

#!/bin/sh

export APPLICATION=$1
export VERSION=$2
echo Publishing docker image for $APPLICATION application with VERSION=$VERSION

sudo docker push starfireaviation/$APPLICATION:$VERSION

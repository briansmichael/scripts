#!/bin/sh

export APPLICATION=$1
export VERSION=$2
echo Running docker image $APPLICATION application with VERSION=$VERSION

docker run -it starfireaviation/$APPLICATION:$VERSION
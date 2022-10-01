#!/bin/sh

export APPLICATION=$1
export BUILD_VERSION=$2
echo Publishing docker image for $APPLICATION application with BUILD_VERSION=$BUILD_VERSION

docker push starfireaviationllc/$APPLICATION:$BUILD_VERSION

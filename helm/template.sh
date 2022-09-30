#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Rendering template for the $APPLICATION

helm template ./$APPLICATION
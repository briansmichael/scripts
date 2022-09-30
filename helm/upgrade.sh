#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Upgrading $APPLICATION

helm upgrade $APPLICATION ./$APPLICATION

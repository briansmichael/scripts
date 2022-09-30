#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Upgrading $APPLICATION

sudo helm upgrade $APPLICATION ./$APPLICATION

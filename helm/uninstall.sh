#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Uninstalling $APPLICATION

sudo helm uninstall $APPLICATION

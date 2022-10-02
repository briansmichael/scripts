#!/bin/sh

export APPLICATION=$1
export NAMESPACE=$2
echo Upgrading $APPLICATION

cd ~/git/$APPLICATION
helm upgrade $APPLICATION ./helm --namespace $NAMESPACE

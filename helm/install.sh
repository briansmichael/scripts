#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Installing $APPLICATION

sudo helm install --namespace $NAMESPACE $APPLICATION ./$APPLICATION

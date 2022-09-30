#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Installing $APPLICATION

helm install --namespace $NAMESPACE --name $APPLICATION ./$APPLICATION
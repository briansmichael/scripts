#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Installing $APPLICATION

helm install --create-namespace --namespace $NAMESPACE $APPLICATION ./$APPLICATION

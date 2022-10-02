#!/bin/sh

export APPLICATION=$1
export NAMESPACE=$2
echo Installing $APPLICATION

cd ~/git/$APPLICATION
helm install --create-namespace --namespace $NAMESPACE $APPLICATION ./helm

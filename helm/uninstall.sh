#!/bin/sh

export APPLICATION=$1
export NAMESPACE=$2
echo Uninstalling $APPLICATION

helm uninstall $APPLICATION --namespace $NAMESPACE

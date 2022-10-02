#!/bin/sh

export APPLICATION=$1
export NAMESPACE=$2
echo Rolling back $APPLICATION

helm rollback $APPLICATION 1 --namespace $NAMESPACE

#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Rolling back $APPLICATION

helm rollback $APPLICATION 1
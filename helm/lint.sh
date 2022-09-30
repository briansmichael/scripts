#!/bin/sh

export APPLICATION=$1
export VERSION=$2
export NAMESPACE=$3
echo Linting $APPLICATION

sudo helm lint ./$APPLICATION

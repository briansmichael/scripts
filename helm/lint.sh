#!/bin/sh

export APPLICATION=$1
echo Linting $APPLICATION

cd ~/git/$APPLICATION
helm lint ./helm

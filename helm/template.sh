#!/bin/sh

export APPLICATION=$1
echo Rendering template for the $APPLICATION

cd ~/git/$APPLICATION
helm template ./helm

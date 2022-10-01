#!/bin/sh

# Make sure to stop script execution if errors are encountered
set -e

# Define script variables
export APPLICATION=$1
cd ~/git/$APPLICATION/
export PR_NUM=$2
export SHORT_HASH=`git rev-parse --short HEAD`
export VERSION=`mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | sed -n -e '/^\[.*\]/ !{ /^[0-9]/ { p; q } }'`
export BUILD_VERSION=$VERSION-$SHORT_HASH
export NAMESPACE=$APPLICATION-PR$PR_NUM

# Write out variables for debug purposes
echo "APPLICATION=$APPLICATION; PR_NUM=$PR_NUM; VERSION=$VERSION; NAMESPACE=$NAMESPACE; SHORT_HASH=$SHORT_HASH; BUILD_VERSION=$BUILD_VERSION"

# Make sure git is up-to-date
# TODO checkout PR branch
git pull

# Build application
mvn clean install

# Build docker image
~/git/scripts/docker/build.sh $APPLICATION $VERSION $BUILD_VERSION
~/git/scripts/docker/push.sh $APPLICATION $BUILD_VERSION

# Update application version in helm chart
cd ~/git/scripts
yq eval '.appVersion = env(BUILD_VERSION)' -i "helm/$APPLICATION/Chart.yaml"

# Perform helm release
cd ~/git/scripts/helm/
./install.sh $APPLICATION $BUILD_VERSION $NAMESPACE
#./upgrade.sh $APPLICATION $BUILD_VERSION $NAMESPACE
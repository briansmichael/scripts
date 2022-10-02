#!/bin/sh

# Make sure to stop script execution if errors are encountered
set -e

# Define script variables
export APPLICATION=$1
export PR_NUM=$2
cd ~/git/$APPLICATION/
# TODO checkout PR branch
git pull
export SHORT_HASH=`git rev-parse --short HEAD`
export VERSION=`mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | sed -n -e '/^\[.*\]/ !{ /^[0-9]/ { p; q } }'`
export BUILD_VERSION=$VERSION-$SHORT_HASH
export NAMESPACE=$APPLICATION-PR$PR_NUM

# Write out variables for debug purposes
echo "APPLICATION=$APPLICATION; PR_NUM=$PR_NUM; VERSION=$VERSION; NAMESPACE=$NAMESPACE; SHORT_HASH=$SHORT_HASH; BUILD_VERSION=$BUILD_VERSION"

# Build application
mvn clean install

# Build docker image
~/git/scripts/docker/build.sh $APPLICATION $VERSION $BUILD_VERSION
~/git/scripts/docker/push.sh $APPLICATION $BUILD_VERSION

# Update application version in helm chart
yq eval '.appVersion = env(BUILD_VERSION)' -i "helm/Chart.yaml"
yq eval '.image.tag = env(BUILD_VERSION)' -i "helm/values.yaml"

# Perform helm release
~/git/scripts/helm/install.sh $APPLICATION $NAMESPACE
#~/git/scripts/helm/upgrade.sh $APPLICATION $NAMESPACE
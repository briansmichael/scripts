#!/usr/bin/env bash

USERNAME=$3
PASSWORD=$4
ORGANIZATION="starfireaviationllc"
APPLICATION=$1
TAG=$2

login_data() {
cat <<EOF
{
  "username": "$USERNAME",
  "password": "$PASSWORD"
}
EOF
}

TOKEN=`curl -s -H "Content-Type: application/json" -X POST -d "$(login_data)" "https://hub.docker.com/v2/users/login/" | jq -r .token`

curl "https://hub.docker.com/v2/repositories/${ORGANIZATION}/${APPLICATION}/tags/${TAG}/" \
-X DELETE \
-H "Authorization: JWT ${TOKEN}"
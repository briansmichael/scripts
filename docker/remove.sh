#!/usr/bin/env bash

APPLICATION=$1
TAG=$2
USERNAME=$3
PASSWORD=$4

login_data() {
cat <<EOF
{
  "username": "$USERNAME",
  "password": "$PASSWORD"
}
EOF
}

TOKEN=`curl -s -H "Content-Type: application/json" -X POST -d "$(login_data)" "https://hub.docker.com/v2/users/login/" | jq -r .token`

curl "https://hub.docker.com/v2/repositories/starfireaviationllc/${APPLICATION}/tags/${TAG}/" \
-X DELETE \
-H "Authorization: JWT ${TOKEN}"
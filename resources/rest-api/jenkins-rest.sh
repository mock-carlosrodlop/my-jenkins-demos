#!/bin/sh

TYPE="GET" #"POST or GET"
JENKINS_USER_ID=example-user
JENKINS_API_TOKEN=******

curl -v -X $TYPE --user "${JENKINS_USER_ID}:${JENKINS_API_TOKEN}" "$@"
#!/bin/sh

JENKINS_USER_ID=user_example
JENKINS_API_TOKEN=****
JENKINS_URL=https://jenkins-example/cjoc/

curl -v --user "${JENKINS_USER_ID}:${JENKINS_API_TOKEN}" "${JENKINS_URL}/$@"
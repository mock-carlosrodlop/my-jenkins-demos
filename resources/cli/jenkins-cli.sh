#!/bin/sh

JENKINS_USER_ID=carlos
JENKINS_API_TOKEN=example-user
JENKINS_URL=https://example-jenkins

java -jar jenkins-cli.jar -auth $JENKINS_USER_ID:$JENKINS_API_TOKEN -s $JENKINS_URL "$@"
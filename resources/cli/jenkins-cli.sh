#!/bin/sh

JENKINS_USER_ID=carlos
JENKINS_API_TOKEN=114a29c34c0be08cc75a4d728c6a81d8f9
JENKINS_URL=https://core.gcp.support.beescloud.com/cjoc/

java -jar jenkins-cli.jar -auth $JENKINS_USER_ID:$JENKINS_API_TOKEN -s $JENKINS_URL "$@"
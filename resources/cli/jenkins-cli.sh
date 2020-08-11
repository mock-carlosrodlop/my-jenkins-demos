#!/bin/sh

JENKINS_USER_ID=carlos
JENKINS_API_TOKEN=*****
JENKINS_URL=https://core.gcp.support.beescloud.com/cjoc/

java -jar jenkins-cli.jar -auth $JENKINS_USER_ID:$JENKINS_API_TOKEN -s $JENKINS_URL "$@"
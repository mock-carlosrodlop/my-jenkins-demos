#!/bin/sh

JENKINS_USER_ID=my_user
JENKINS_API_TOKEN=*****
JENKINS_URL=https://jenkins.example/

java -jar jenkins-cli.jar -auth $JENKINS_USER_ID:$JENKINS_API_TOKEN -s $JENKINS_URL "$@"
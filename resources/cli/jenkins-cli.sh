#!/bin/sh

JENKINS_USER_ID=example-user
JENKINS_API_TOKEN=t0K345555
JENKINS_URL=https://example-jenkins

echo "[INFO]: Downloading CLI"
wget ${JENKINS_URL}/jnlpJars/jenkins-cli.jar
echo "[INFO]: Runing command"
java -jar jenkins-cli.jar -auth $JENKINS_USER_ID:$JENKINS_API_TOKEN -logger FINE -s $JENKINS_URL "$@"
echo "[INFO]: Removing CLI"
rm jenkins-cli.jar
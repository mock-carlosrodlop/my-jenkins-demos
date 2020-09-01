#!/bin/sh

JENKINS_USER_ID=carlos
JENKINS_API_TOKEN=111df9ff4565212a888e04c4763664bdee
JENKINS_URL=https://core.gcp.support.beescloud.com/cjoc/

curl -v --user "${JENKINS_USER_ID}:${JENKINS_API_TOKEN}" "${JENKINS_URL}/$@"
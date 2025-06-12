#!/bin/bash

set -e

echo $JENKINS_AGENT_NAME
echo $JENKINS_URL
echo $ADMIN_USERNAME
echo $ADMIN_PASSWORD

echo "Waiting for Jenkins to start..."
sleep 10

echo "Registering '${JENKINS_AGENT_NAME}' with Jenkins..."
SECRET=$(curl -s -X GET -u "${ADMIN_USERNAME}:${ADMIN_PASSWORD}" "${JENKINS_URL}/computer/$JENKINS_AGENT_NAME/slave-agent.jnlp" | xmllint --xpath "(/jnlp/application-desc/argument)[1]/text()" -)
export JENKINS_SECRET="$SECRET"
exec jenkins-agent

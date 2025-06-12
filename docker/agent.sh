#!/bin/bash

set -e

JENKINS_AGENT_NAME=${JENKINS_AGENT_NAME}
JENKINS_URL=${JENKINS_URL}
ADMIN_USERNAME=${ADMIN_USERNAME}
ADMIN_PASSWORD=${ADMIN_PASSWORD}

echo "Waiting for Jenkins to be up..."
sleep 10

# echo $JENKINS_AGENT_NAME
# echo $JENKINS_URL
# echo $ADMIN_USERNAME
# echo $ADMIN_PASSWORD
# curl -s -X GET -u "${ADMIN_USERNAME}:${ADMIN_PASSWORD}" "${JENKINS_URL}/computer/$JENKINS_AGENT_NAME/slave-agent.jnlp"

echo "Registering agent with Jenkins and retrieving secret..."
SECRET=$(curl -s -X GET -u "${ADMIN_USERNAME}:${ADMIN_PASSWORD}" "${JENKINS_URL}/computer/$JENKINS_AGENT_NAME/slave-agent.jnlp" | xmllint --xpath "(/jnlp/application-desc/argument)[1]/text()" -)
export JENKINS_SECRET="$SECRET"

exec jenkins-agent

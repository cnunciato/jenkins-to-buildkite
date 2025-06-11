#!/bin/bash

set -e

JENKINS_AGENT_NAME=${JENKINS_AGENT_NAME:-agent1}
JENKINS_URL=${JENKINS_URL:-http://jenkins:8080}

ADMIN_USERNAME=${ADMIN_USERNAME:-admin}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-admin}

echo "Waiting for Jenkins to be up..."
sleep 20

echo "Registering agent with Jenkins and retrieving secret..."
SECRET=$(curl -s -X GET -u "${ADMIN_USERNAME}:${ADMIN_PASSWORD}" "${JENKINS_URL}/computer/$JENKINS_AGENT_NAME/slave-agent.jnlp" | xmllint --xpath "(/jnlp/application-desc/argument)[1]/text()" -)
export JENKINS_SECRET="$SECRET"

exec jenkins-agent

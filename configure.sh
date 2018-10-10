#!/bin/bash

read -p 'enter your newrelic license key: ' NR_LICENSE
read -p 'enter your newrelic application name: ' NR_APP_NAME

[[ -d apigee-dt-frontend ]] || mkdir apigee-dt-frontend/newrelic
cd apigee-dt-frontend/newrelic
[[ -e newrelic.jar ]] || curl -o newrelic.jar https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic.jar
curl -o newrelic.yml https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic.yml

sed -e "s/^  license_key:.*/  license_key: $NR_LICENSE/" -e "s/^  app_name: My Application/  app_name: $NR_APP_NAME/" < newrelic.yml > newrelic.yml.i
mv newrelic.yml.i newrelic.yml

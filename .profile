#!/bin/bash

host=$(echo "$VCAP_SERVICES" | jq -r '.["aws-rds"][] | select(.name == "keycloak-db") | .credentials.host')
db_name=$(echo "$VCAP_SERVICES" | jq -r '.["aws-rds"][] | select(.name == "keycloak-db") | .credentials.db_name')
username=$(echo "$VCAP_SERVICES" | jq -r '.["aws-rds"][] | select(.name == "keycloak-db") | .credentials.username')
password=$(echo "$VCAP_SERVICES" | jq -r '.["aws-rds"][] | select(.name == "keycloak-db") | .credentials.password')
jdk_version=$(cat JDK_VERSION)

export KC_DB_URL_HOST=$host
export KC_DB_URL_DATABASE=$db_name
export KC_DB_USERNAME=$username
export KC_DB_PASSWORD=$password
export PATH=$PATH:/home/vcap/app/jdk-$jdk_version/bin

export KC_HTTPS_CERTIFICATE_FILE=$CF_INSTANCE_CERT
export KC_HTTPS_CERTIFICATE_KEY_FILE=$CF_INSTANCE_KEY

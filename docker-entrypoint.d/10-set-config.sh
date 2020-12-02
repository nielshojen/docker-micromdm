#!/bin/sh

sleep 5

if [[ ${TLS} = true ]]; then
  SERVER_URL="https://localhost:443"
else
  SERVER_URL="http://localhost:8080"
fi


execMdmctl="/usr/local/bin/mdmctl config set -api-token ${API_KEY} -name production -server-url ${SERVER_URL}"

echo "Configuring mdmctl using: $execMdmctl"

$execMdmctl
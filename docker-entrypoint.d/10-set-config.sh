#!/bin/sh

sleep 40

execMdmctl="/usr/local/bin/mdmctl config set -api-token ${API_KEY} -name production -server-url ${MICROMDM_SERVER_URL}"

echo "Configuring mdmctl using: $execMdmctl"

$execMdmctl
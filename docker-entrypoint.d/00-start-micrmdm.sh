#!/bin/sh

echo "Waiting to make sure storage is up"

sleep 30

# Make sure we have the needed folders
if [[ ${MICROMDM_CONFIG_DIR} ]]; then
  mkdir -p ${MICROMDM_CONFIG_DIR}
fi

if [[ ${MICROMDM_CERTS_DIR} ]]; then
  mkdir -p ${MICROMDM_CERTS_DIR}
fi

if [[ ${MICROMDM_REPO_DIR} ]]; then
  mkdir -p ${MICROMDM_REPO_DIR}
fi


execServe="/usr/local/bin/micromdm serve -server-url='${MICROMDM_SERVER_URL}' -filerepo ${MICROMDM_REPO_DIR} -config-path ${MICROMDM_CONFIG_DIR}"

# add api key if specified
if [[ ${API_KEY} ]]; then
  execServe="${execServe} -api-key ${API_KEY}"
fi

if [[ ${TLS} = true ]]; then
  execServe="${execServe} -tls"
else
  execServe="${execServe} -tls=false"
fi

if [[ ${TLS_CERT} ]] && [[ ${TLS_KEY} ]]; then
  execServe="${execServe} -tls-cert '${TLS_CERT}' -tls-key '${TLS_KEY}'"
fi

#if [[ "${HOMEPAGE}" = "false" ]]; then
#  execServe="${execServe} -homepage=false"
#fi

if [[ ${WEBHOOK_URL} ]]; then
  execServe="${execServe} -command-webhook-url ${WEBHOOK_URL}"
fi

if [[ ${DEBUG} ]]; then
  execServe="${execServe} -http-debug"
fi

echo "Starting using: $execServe"

$execServe &
#!/bin/sh

execServe="/usr/local/bin/micromdm serve -server-url='${SERVER_URL}' -filerepo /data/repo -config-path /data/config"

# add api key if specified
if [[ ${API_KEY} ]]; then
  execServe="${execServe} -api-key ${API_KEY}"
fi

if [[ ${TLS} = true ]]; then
  execServe="${execServe} -tls"
else
  execServe="${execServe} -tls=false"
fi

if [[ ! -z ${TLS_CERT} && ! -z ${TLS_KEY} ]]; then
  execServe="${execServe} -tls-cert '${TLS_CERT}' -tls-key '${TLS_KEY}'"
fi

if [[ ${HOMEPAGE} = false ]]; then
  execServe="${execServe} -homepage=false"
fi

if [[ ${WEBHOOK_URL} ]]; then
  execServe="${execServe} -command-webhook-url ${WEBHOOK_URL}"
fi

if [[ ${DEBUG} ]]; then
  execServe="${execServe} -http-debug"
fi

echo "Starting using: $execServe"

eval $execServe

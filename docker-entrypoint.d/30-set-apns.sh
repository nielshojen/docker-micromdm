#!/bin/sh  

if [[ ${APNS_PUSH_CERT} ]] && [[ ${APNS_PUSH_CERT_KEY} ]] && [[ ${APNS_PASSWORD} ]]; then
  sleep 5
  execMdmctl="mdmctl mdmcert upload -cert ${APNS_PUSH_CERT}  -private-key ${APNS_PUSH_CERT_KEY} -password=${APNS_PASSWORD}"
  echo "Configuring mdmctl APNS certs using: $execMdmctl"
  $execMdmctl
fi
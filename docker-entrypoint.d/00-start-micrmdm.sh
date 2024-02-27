#!/bin/sh

execServe="/usr/local/bin/micromdm serve"

if [[ ${MICROMDM_LOG_TIME} = "truew" ]]; then
  sleep 5
  execServe="${execServe} -log-time"
  echo "Including timestamp in log messages: $execServe"
  $execMdmctl
fi

$execServe &

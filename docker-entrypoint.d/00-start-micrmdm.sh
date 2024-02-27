#!/bin/sh

execServe="/usr/local/bin/micromdm serve"

if [[ ${MICROMDM_LOG_TIME} = "true" ]]; then
  execServe="${execServe} -log-time"
fi

$execServe &

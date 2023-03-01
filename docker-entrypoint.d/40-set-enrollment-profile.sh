#!/bin/sh  

if [[ ${ENROLLMENT_PROFILE} ]]; then
  sleep 5
  execMdmctl="mdmctl apply profiles -f ${ENROLLMENT_PROFILE}"
  echo "Configuring mdmctl Enrollment Profile using: $execMdmctl"
  $execMdmctl
fi

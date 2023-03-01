#!/bin/sh

sleep 5

execMdmctl="/usr/local/bin/mdmctl config switch -name production"

echo "Switching config using: $execMdmctl"

$execMdmctl

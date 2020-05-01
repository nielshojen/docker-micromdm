#!/bin/sh

sleep 50

execMdmctl="/usr/local/bin/mdmctl config switch -name production"

echo "Switching config using: $execMdmctl"

$execMdmctl
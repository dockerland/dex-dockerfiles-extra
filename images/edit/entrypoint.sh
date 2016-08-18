#!/usr/bin/env bash

[ -d "/dex/workspace" ] || { echo "/dex/workspace is missing" ; exit 1 ; }
exec dosemu "edit $@"
exit $?

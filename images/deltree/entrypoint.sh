#!/usr/bin/env bash

# set dosemu keyboard layout. to change, run:
#  export DEX_DOCKER_FLAGS="-e DOSEMU_LAYOUT=<layout>"
#
# accepted layouts:
#   finnish(-latin1), de(-latin1), be, it, us, uk, dk(-latin1),
#   keyb-no, no-latin1, dvorak, pl, po, sg(-latin1), fr(-latin1), sf(-latin1),
#   es(-latin1), sw, hu(-latin2), hu-cwi, keyb-user, hr-cp852, hr-latin2,
#   cz-qwerty, cz-qwertz, ru, tr.

echo "\$_layout = \"$DOSEMU_LAYOUT\"" >> /etc/dosemu/dosemu.conf

[ -d "/dex/workspace" ] || { echo "/dex/workspace is missing" ; exit 1 ; }
dosemu -dumb "deltree $@"
exit $?

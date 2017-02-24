#!/bin/sh

# Loosely based on http://tools.suckless.org/ii/bots
# Development time: about 2 minutes.
# Serve fresh with
#  tail -n 0 -F /var/log/apache2/report.bsf-intranet.org/access.log > ~/irc/${NETWORK}/${CHANNEL}/in

NETWORK=irc.freenode.net
CHANNEL=ideascube
NICK=reportcube
GECOS="ansible-pull report"

while true; do
    ii -s $NETWORK -n $NICK -f "$GECOS" &
    iipid="$!"
    sleep 5
    printf "/j %s\n" "#${CHANNEL}" > ~/irc/${NETWORK}/in
    wait "$iipid"
done

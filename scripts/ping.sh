#!/bin/bash

source config.sh

echo "Recieved ping: $@"

PAYLOAD=$(echo "$@" | cut -d: -f2)

echo "PONG :$PAYLOAD" > $TELNET_IN

echo "Responded pong!"

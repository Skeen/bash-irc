#!/bin/bash

source config.sh

echo "Logging in as $USER"

echo "NICK $USER" > $TELNET_IN
echo "USER  ${USER,,} 8 *  : $REAL" > $TELNET_IN

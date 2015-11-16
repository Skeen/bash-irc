#!/bin/bash

source config.sh

SOURCE=$USER
TARGET=$1
MESSAGE=$2
TIME=$(date +%s)

echo "Sending '$MESSAGE' to $TARGET..."

echo "PRIVMSG $TARGET :$MESSAGE" > $TELNET_IN

echo "$TIME:$SOURCE:$TARGET:$MESSAGE" >> $SEND_MESSAGES


#!/bin/bash

source config.sh

line=$@

SOURCE=$(echo $line | cut -c2- | cut -d! -f1)
TARGET=$(echo $line | cut -d' ' -f3)
MESSAGE=$(echo $line | cut -d: -f3)
TIME=$(date +%s)

echo "Message from $SOURCE to $TARGET: $MESSAGE"

echo "$TIME:$SOURCE:$TARGET:$MESSAGE" >> $RECV_MESSAGES


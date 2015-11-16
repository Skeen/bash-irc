#!/bin/bash

source config.sh

echo "Starting up processor..." >> $MAIN_LOG

while read line; do
    # Log us in
    LOG_IN=$(echo $line | grep "*** No Ident response")
    if [ $? -eq 0 ]; then
        ./login.sh >> $MAIN_LOG
    fi
    # Handle pings (keep us online)
    PING=$(echo $line | grep "PING :")
    if [ $? -eq 0 ]; then
        ./ping.sh $line >> $MAIN_LOG
    fi
#    # Signal that we're logged in
#    LOGGED_IN=$(echo $line | grep ":$USER MODE $USER :+i")
#    if [ $? -eq 0 ]; then
#        echo "LOGGED_IN" >> state
#    fi
    # Dump messages to messages
    MESSAGE=$(echo $line | grep "PRIVMSG")
    if [ $? -eq 0 ]; then
        ./parse_message.sh $line >> $MAIN_LOG
    fi
    # Dump everything to log
    ./log.sh $line >> $MAIN_LOG
done

echo "Processor shutdown!" >> $MAIN_LOG

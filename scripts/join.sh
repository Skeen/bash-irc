#!/bin/bash

source config.sh

echo "Joining channel $1..."

echo "JOIN $1" > $TELNET_IN

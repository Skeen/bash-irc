#!/bin/bash

source scripts/config.sh

function usage() {
# TODO:
    echo "Eventual usage information here."
}

function unknown_command() {
    echo "wat?"
}

COMMAND=$1
shift 1

case "$COMMAND" in
    "") usage ;; 
    "join") cd $SRC_DIR && ./join.sh "$1" ;;
    "message") cd $SRC_DIR && ./message.sh "$1" "$2" ;;
    *) unknown_command ;;
esac


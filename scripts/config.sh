#!/bin/bash

SERVER="irc.freenode.net"
PORT=6667

USER="Skeenia"
REAL="Emil Madsen"

TELNET_IN=/tmp/bash-irc-telnet-in
TELNET_OUT=/tmp/bash-irc-telnet-out

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LOG_FOLDER=$SRC_DIR/../logs
MAIN_LOG=$LOG_FOLDER/log
IRC_RAW=$LOG_FOLDER/irc_raw
RECV_MESSAGES=$LOG_FOLDER/recv_messages
SEND_MESSAGES=$LOG_FOLDER/send_messages

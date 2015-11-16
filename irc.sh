#!/bin/bash

source scripts/config.sh

# Function to ctrl-c all children
echo -e "Installing ctrl-c handler... \c"
function killstuff 
{
  jobs -p | xargs kill
}
trap killstuff SIGINT
echo "OK"

# Remove pipes and recreate
echo -e "Creating pipes... \c"
rm -f $TELNET_OUT
rm -f $TELNET_IN
mkfifo $TELNET_OUT $TELNET_IN
echo "OK"

# Clean-up output files
rm -rf $LOG_FOLDER
mkdir -p $LOG_FOLDER

# Startup telnet, connect to server
echo -e "Staring up telnet client... \c"
( telnet $SERVER $PORT > $TELNET_OUT < $TELNET_IN ) &
## TODO: Use: $!
echo "OK"

# Startup processor
echo -e "Starting up main processing loop... \c"
touch $MAIN_LOG
( cd scripts && ./main.sh > $TELNET_IN < $TELNET_OUT ) &
echo "OK"

# Bind telnet to processor, and keep pipes flowing
echo -e "Keeping pipe ends open... \c"
( exec 30<$TELNET_OUT 31>$TELNET_IN )
echo "OK"

echo
echo "Outputting main-loop logs:"
echo
tail -f $MAIN_LOG

echo "Shutdown!"

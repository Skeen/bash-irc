## BASH-IRC

A simple IRC bot written in bash using unix utils.

* `telnet`: For raw communications
* `mkfifo`: For inter-process communication (IPC)
* `grep,cut`: For text processing

## Structure
The general structure is that two programs are started in the background;

* `telnet`: For connecting to the IRC server,
* `main.sh`: For parsing the output of the `telnet` connection.

Starting these processes is done by `./irc.sh`, configuration is done in `scripts/config.sh`.

Once started commands (joining channels / sending messages) can be done using `./command.sh`.

## Output
Output is generated to the `logs` subfolder. The main interest is the two message files:

* `recv_messages`
* `send_messages`

The names should be self-documenting.

#!/bin/bash
##### special variables #####
echo "all variables passed to the script: $@"
echo "number of variables passed to the script: $#"

echo "script name: $0"
echo "process id of the script: $$"
echo "who is running the script: $USER"
echo "which directory the script is running from: $PWD"
echo "home directory of the user running the script: $HOME"
echo "pid of the current script: $$"
sleep 5 &
echo "pid of the background command running just now: $!"
wait $!
echo "line number of the script: $LINENO"
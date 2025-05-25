#!/bin/bash

echo "All variables:: $@"
echo "Number of variables:: $#"
echo "Script name: $0"
echo "Current directory: $PWD"
echo "User running this script: $USER"
echo "Home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"

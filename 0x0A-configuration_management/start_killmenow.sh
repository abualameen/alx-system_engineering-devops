#!/bin/bash

# Start the killmenow process
./killmenow &

# Capture the PID and save it to a file
echo $! > /tmp/killmenow_pid

#!/usr/bin/bash

# Terminate if dunst is already running
killall -q dunst

# Wait until the processes have been shut down
while pgrep -x dunst >/dev/null; do sleep 1; done

# Launch dunst
dunst &

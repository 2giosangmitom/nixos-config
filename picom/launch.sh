#!/usr/bin/bash

# Terminate if picom is already running
killall -q picom

# Wait until the processes have been shut down
while pgrep -x picom >/dev/null; do sleep 1; done

# Launch picom
picom --config "$HOME/.config/picom/picom.conf" &

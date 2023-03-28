#!/usr/bin/bash

DIR="$HOME/.config/picom"

killall -q picom
while pgrep -x picom >/dev/null; do sleep 1; done
picom --config "$DIR"/picom.conf &

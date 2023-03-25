#!/usr/bin/bash

DIR="$HOME/.config/picom"

if [[ $(pgrep -x picom) ]]; then
	killall -q picom
	while pgrep -x picom >/dev/null; do sleep 1; done
fi

picom --config "$DIR"/picom.conf &

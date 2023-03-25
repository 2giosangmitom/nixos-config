#!/usr/bin/bash

DIR="$HOME/.config/polybar"

if [[ $(pgrep -x polybar) ]]; then
	killall -q polybar
	while pgrep -x polybar >/dev/null; do sleep 1; done
fi

polybar -q main -c "$DIR"/config.ini &

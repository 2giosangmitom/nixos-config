#!/usr/bin/env bash

if ! (pgrep -x swww-daemon >/dev/null); then
	swww clear-cache
	if ! (swww-daemon --format xrgb &) then
		echo "Failed to start swww-daemon" >&2
		exit 1
	fi
	sleep 1
fi

BACKGROUND_IMAGE=$(shuf -en1 /etc/nixos/backgrounds/*)
swww img "$BACKGROUND_IMAGE"

#!/usr/bin/env bash

if !(pgrep swww-daemon); then
	swww clear-cache
	swww-daemon --format xrgb &
fi

swww img $(shuf -en1 /etc/nixos/backgrounds/*)
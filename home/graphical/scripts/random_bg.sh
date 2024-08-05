#!/usr/bin/env bash

if pgrep -x swaybg >/dev/null; then
  pkill swaybg
fi

BACKGROUND_IMAGE=$(shuf -en1 /etc/nixos/backgrounds/*)
swaybg --image "$BACKGROUND_IMAGE" --mode fit

#!/usr/bin/env bash

if ! pgrep -u "$UID" -x swww-daemon >/dev/null; then
  swww-daemon &
  swww img /etc/nixos/modules/home/graphical/bg.jpeg
fi

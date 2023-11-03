#!/usr/bin/bash

killall -q swaybg
while pgrep -x swaybg >/dev/null; do sleep 1; done
swaybg -i $(find ~/.config/sway/wallpaper/* | shuf -n1) -m fill &

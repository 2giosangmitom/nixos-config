#!/bin/bash

killall waybar
DIR="$HOME/.config/waybar"

while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

waybar -c "$DIR"/config -s "$DIR"/style.css &

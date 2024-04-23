#!/usr/bin/env bash

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

DIR="$HOME/.config/waybar"

# Start waybar
case "$1" in
  "--sway") waybar -c $DIR/config-sway.jsonc -s $DIR/style-sway.css
  ;;
  "--hyprland") waybar -c $DIR/config-hyprland.jsonc -s $DIR/style-hyprland.css
  ;;
  *) echo "$1 is not a valid argument"
  ;;
esac

